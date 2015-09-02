require 'singleton'

module SoCli
  class Settings
    include Singleton
    
    attr_accessor :verbose
    @verbose = false
  end
end