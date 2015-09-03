require 'fileutils'
require 'psych'

module SoCli
  class Config
    attr_accessor :sources
    
    def initialize(settings)
      @settings = settings
    end
    
    def load
      yaml = File.read(@settings.config_file)
      loaded = Psych.load(yaml)
      
      @sources = loaded["sources"] || []
    end
    
    def save
      to_save = { "sources" => @sources }
      
      yaml = Psych.dump(to_save)
      File.write(@settings.config_file, yaml)
    end
    
    def first_run_initialization
      FileUtils::mkdir_p(@settings.config_directory)
      FileUtils::mkdir_p(@settings.sources_directory)
      @sources = ["git@github.com:fortinmike/so-cli-built-in-actions.git"]
      save
    end
  end
end