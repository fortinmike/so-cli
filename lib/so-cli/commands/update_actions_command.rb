require_relative 'command'
require 'so-cli/sources/sources'
require 'so-cli/actions/actions'

module SoCli
  class UpdateActionsCommand < Command
    self.command = "update-actions"
    self.summary = "Update all actions by pulling the latest changes from sources and reloading everything."
    
    def run
      Sources.update
      Sources.all.each { |s| Actions.reload(s.path) }
    end
  end
end