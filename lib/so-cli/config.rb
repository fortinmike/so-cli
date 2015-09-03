module SoCli
  class Config
    attr_accessor :sources
    
    def initialize
      # TODO: Use an empty array, this is for testing purposes
      @sources = ["git@github.com:fortinmike/so-cli.git"]
    end
    
    def load
    end
    
    def save
    end
  end
end