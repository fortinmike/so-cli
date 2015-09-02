require 'cgi'

module SoCli
  class Source
    attr_accessor :url
    attr_accessor :path
    
    def initialize(url, path)
      @url = url
      @path = path
    end
    
    def update
      puts "TODO: Pull changes from #{@url} into #{@path}"
    end
    
    def actions
      puts "TODO: Return all actions in the source here"
    end
  end
end