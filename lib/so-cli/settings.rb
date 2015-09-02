require 'singleton'

module SoCli
  class Settings
    include Singleton
    
    attr_accessor :verbose
    attr_accessor :config_directory
    attr_accessor :sources_directory
    
    def initialize
      @verbose = false
      @config_directory = File.expand_path("~/.so-cli")
      @sources_directory = File.join(@config_directory, "sources")
    end
  end
end