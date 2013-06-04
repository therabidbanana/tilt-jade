if defined?(Rails)
  module TiltJade
    class Engine < Rails::Engine
      config.before_initialize do |app|
        require 'sprockets/engines'
        require "tilt-jade/template"
        Sprockets.register_engine '.jade', ::TiltJade::Template
      end
    end
  end
end