require_relative 'source'
require 'so-cli/settings'

module SoCli
  class Sources
    def initialize(sources_directory)
      @sources_directory = sources_directory
    end
    
    def add(url)
      puts "TODO: Add source #{url} to the config"
    end
    
    def remove(url)
      puts "TODO: Remove source #{url} from the config"
    end
    
    def all
      # TODO: Implement real source listing
      url = "git@github.com:fortinmike/so-cli.git"
      path = File.join(@sources_directory, CGI.escape(url))
      dummy_source = Source.new(url, path)
      return [dummy_source]
    end
    
    def update
      puts "TODO: Pull all source repos"
    end
  end
end