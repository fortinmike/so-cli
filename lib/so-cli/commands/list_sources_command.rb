require_relative 'command'

module SoCli
  class ListSourcesCommand < Command
    self.command = "list-sources"
    self.summary = "List configured action sources."
    
    def run
      @sources.all.each { |s| puts s.url }
    end
  end
end