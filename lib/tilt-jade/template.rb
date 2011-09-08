require 'sprockets/engines'
require 'tilt-jade/jade_js'
require 'tilt/template'

module TiltJade
  # Jade template implementation. See:
  # http://jade-lang.com/
  #
  class Template < ::Tilt::Template
    def self.default_mime_type 
      'application/javascript'
    end

    # def self.engine_initialized?
    #   defined? ::JadeJs
    # end

    def prepare
    end

    def evaluate(scope, locals, &block)
      options[:locals] = locals
      options[:client] = true
      options[:compileDebug] = false
      options[:filename] = file
      
      JadeJs.compile(data, options)
    end

  end
end


