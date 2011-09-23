if defined?(Rails)
  module TiltJade
    class Engine < Rails::Engine
      initializer "tilt_jade.configure_rails_initialization" do |app|
        next unless app.config.assets.enabled

        require 'sprockets'
        require 'sprockets/engines'
        require "tilt-jade/template"
        if app.assets
          app.assets.register_engine '.jade', ::TiltJade::Template
        else
          # Rails 3.1.0rc
          Sprockets.register_engine '.jade', ::TiltJade::Template
        end
      end
    end
  end
end
