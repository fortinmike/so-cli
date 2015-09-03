require_relative 'source'

module SoCli
  class Sources
    def initialize(sources_directory, config)
      @sources_directory = sources_directory
      @config = config
    end
    
    def add(repo_url)
      @config.sources.push(repo_url)
      @config.save
    end
    
    def remove(repo_url)
      @config.sources.delete(repo_url)
      @config.save
    end
    
    def all
      @config.sources.map do |repo_url|
        path = File.join(@sources_directory, CGI.escape(repo_url))
        next Source.new(path, repo_url)
      end
    end
  end
end