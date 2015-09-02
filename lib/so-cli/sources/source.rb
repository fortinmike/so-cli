require 'cgi'

module SoCli
  class Source
    attr_accessor :url
    attr_accessor :path
    
    def initialize(url, path)
      @url = url
      @path = path
    end
  end
end