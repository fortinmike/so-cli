require_relative 'command'

module SoCli
  class RemoveSourceCommand < Command
    self.command = "remove-source"
    self.summary = "Remove an action source."
    
    def self.options
      [['<repo_url>', 'The URL of the source to remove.']].concat(super)
    end
    
    def initialize(argv)
      @url = argv.shift_argument
      super
    end

    def validate!
      super
      help! "You must provide a source URL to remove" unless @url
    end
    
    def run
      @sources.remove(@url)
    end
  end
end