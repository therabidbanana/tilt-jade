module JadeJs
  module Source
    def self.bundled_path
      File.expand_path("../../../vendor/assets/javascripts/tilt-jade/jade.js", __FILE__)
    end
    def self.bundled_runtime_path
      File.expand_path("../../../vendor/assets/javascripts/tilt-jade/runtime.js", __FILE__)
    end
  end
end
