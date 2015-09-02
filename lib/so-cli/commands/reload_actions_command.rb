require_relative 'command'
require 'so-cli/sources/sources'

module SoCli
  class ReloadCommand < Command
    self.command = "reload-actions"
    self.summary = "Reload all actions from disk, without pulling first."
    
    def run
      Sources.update
    end
  end
end