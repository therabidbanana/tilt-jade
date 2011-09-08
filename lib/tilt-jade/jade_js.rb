require 'execjs'
require 'jade_js/source'

module JadeJs
  EngineError      = ExecJS::RuntimeError
  CompilationError = ExecJS::ProgramError

  # Your code goes here...
  module Source

    def self.path
      @path ||= ENV['JADE_SOURCE_PATH'] || bundled_path
    end

    def self.path=(path)
      @contents = @version = @bare_option = @context = nil
      @runtime_path = nil
      @path = path
    end

    def self.runtime_path
      @runtime_path ||= ENV['JADE_RUNTIME_SOURCE_PATH'] || bundled_runtime_path
    end

    def self.runtime_path=(path)
      @runtime_path = path
    end

    def self.contents
      @contents ||= File.read(path) + '; var jade = require("jade");'
    end

    # def self.version
    #   @version ||= contents[/Jade Template Compiler v([\d.]+)/, 1]
    # end

    # def self.bare_option
    #   @bare_option ||= contents.match(/noWrap/) ? 'noWrap' : 'bare'
    # end

    def self.context
      @context ||= ExecJS.compile(contents)
    end
  end

  class << self
    def engine
    end

    def engine=(engine)
    end

    def version
      Source.version
    end

    # Compile a script (String or IO) to JavaScript.
    def compile(script, options = {})
      script = script.read if script.respond_to?(:read)

      # if options.key?(:bare)
      # elsif options.key?(:no_wrap)
      #   options[:bare] = options[:no_wrap]
      # else
      #   options[:bare] = false
      # end

      Source.context.eval("jade.compile(#{script.to_json}, #{options.to_json}).toString()")
    end
  end
end
