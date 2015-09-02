require_relative 'source'
require 'so-cli/settings'

module SoCli
  class Sources
    def self.add(url)
      puts "Add source #{url}"
      # TODO: Add a source to the config
    end
    
    def self.remove(url)
      puts "Remove source #{url}"
      # TODO: Remove source from the config
    end
    
    def self.all
      url = "git@github.com:fortinmike/so-cli.git"
      path = File.join(Settings.instance.sources_path, CGI.escape(url))
      dummy_source = Source.new(url, path)
      return [dummy_source]
      # TODO: List all configured sources
    end
    
    def self.update
      puts "Pull all source repos and reloading actions from disk"
      # TODO: Pull all source repos and reload actions
    end
    
    def self.reload
      puts "Reload actions from disk"
      # TODO: Reload actions from all on-disk source repos
    end
  end
end