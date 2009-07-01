# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{configurable}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Mark Evans"]
  s.date = %q{2009-07-01}
  s.email = %q{mark@new-bamboo.co.uk}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.markdown"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.markdown",
     "Rakefile",
     "VERSION",
     "configurable.gemspec",
     "lib/configurable.rb",
     "spec/configurable_spec.rb"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/markevans/configurable}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Simple module for making your class configurable}
  s.test_files = [
    "spec/configurable_spec.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
