require 'spec'
require File.dirname(__FILE__) + '/../lib/configurable'

describe Configurable do

  before(:each) do
    class Car
      extend Configurable
      configurable_attr :colour
      configurable_attr :top_speed, 216
      def self.other_thing=(thing); end
    end    
  end

  describe "setup" do
    it "should provide attr_readers for configurable attributes" do
      Car.should respond_to(:colour)
    end

    it "should not provide attr_writers for configurable attributes" do
      Car.should_not respond_to(:colour=)
    end

    it "should set default values for configurable attributes" do
      Car.top_speed.should == 216
    end

    it "should set the default as nil if not specified" do
      Car.colour.should be_nil
    end
    
    it "should allow specifying configurable attrs as strings" do
      class Bike
        extend Configurable
        configurable_attr 'colour', 'rude'
      end
      Bike.colour.should == 'rude'
    end
  end

  
  describe "configuring" do
    it "should raise an error if there are no configurable attributes" do
      class None; extend Configurable; end
      lambda {
        None.configure{|c|}
      }.should raise_error(Configurable::NothingToConfigure)
    end
    
    it "should allow you to change values" do
      Car.configure do |c|
        c.colour = 'red'
      end
      Car.colour.should == 'red'
    end
    
    it "should not allow you to call other methods on the object via the configuration" do
      lambda{
        Car.configure do |c|
          c.other_thing = 5
        end
      }.should raise_error(Configurable::BadConfigAttribute)
    end
  end
  
  describe "getting configuration" do
    it "should return the configuration as a hash" do
      Car.configuration.should == {:colour => nil, :top_speed => 216}
    end
    it "should not allow you to change the configuration via the hash" do
      Car.configuration[:top_speed] = 555
      Car.top_speed.should == 216
    end
  end

end