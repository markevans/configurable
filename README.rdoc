Configurable
============
This is just a simple module which provides an object with a nice API for configuring it.

The best explanation is with an example.
Here we configure the `ImageProcessor` class.

First declare which attributes we want to be configurable.

    class ImageProcessor
    
      extend Configurable
      
      configurable_attr :processing_lib         # defaults to nil
      configurable_attr :default_format, 'png'  # defaults to 'png'

      # ...other stuff...

    end

Then we can configure them as we need

    ImageProcessor.configure do |c|
      c.processing_lib = 'imagemagick'
    end

Note that we can NOT configure the ImageProcessor by just saying `ImageProcessor.processing_lib = 'imagemagick'`, the only way is via the `configure` method.

We can see what the configuration is at any time like so:

    ImageProcessor.configuration   # {:processing_lib => 'imagemagick', :default_format => 'png'}


Why not just use attr_accessors?
------------------------------
It's more of a conceptual win really. By limiting the configuration of these attributes to the `configure` method, the user knows that they are dealing with the configuration of the object.
Also we are able to view the configuration with `ImageProcessor.configuration` because we've kept them separate from other accessor methods.

Why not just use a `ImageProcessor.config` hash?
----------------------------------------------
Because after configuring an object, the rest of the code shouldn't care whether an attribute had to be configured or not (whereas it would using `ImageProcessor.config[:processing_lib]`).
This way we can decide later that an attribute should actually be configurable, and this is transparent to the rest of the code.

Install
--------
Usual way for github gems.

Copyright
--------
Copyright (c) 2009 Mark Evans. See LICENSE for details.
