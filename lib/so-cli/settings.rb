require 'singleton'

module SoCli
  class Settings
    include Singleton
    
    attr_accessor :verbose
    attr_accessor :sources_path
    
    def initialize
      @verbose = false
      @sources_path = File.expand_path("~/.so-cli/sources")
    end
  end
end