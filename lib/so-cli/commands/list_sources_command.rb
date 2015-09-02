require_relative 'command'
require 'so-cli/sources/sources'

module SoCli
  class ListSourcesCommand < Command
    self.command = "list-sources"
    self.summary = "List configured action sources."
    
    def run
      Sources.list
    end
  end
end