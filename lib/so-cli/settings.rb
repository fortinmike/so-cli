require 'singleton'

module SoCli
  class Settings
    include Singleton
    
    attr_accessor :verbose
    attr_accessor :config_directory
    attr_accessor :config_file
    attr_accessor :sources_directory
    
    def initialize
      @verbose = false
      @config_directory = File.expand_path("~/.so-cli")
      @config_file = File.join(@config_directory, "config.yml")
      @sources_directory = File.join(@config_directory, "sources")
    end
  end
end