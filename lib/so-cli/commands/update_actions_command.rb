require_relative 'command'

module SoCli
  class UpdateActionsCommand < Command
    self.command = "update-actions"
    self.summary = "Update all actions by pulling all sources."
    
    def run
      @sources.update
    end
  end
end