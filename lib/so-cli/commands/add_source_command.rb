require_relative 'command'
require 'so-cli/sources/sources'

module SoCli
  class AddSourceCommand < Command
    self.command = "add-source"
    self.summary = "Add an action source."
    
    def self.options
      [['<repo_url>', 'The URL of a repository containing actions at its root.']].concat(super)
    end
    
    def initialize(argv)
      @url = argv.shift_argument
      super
    end

    def validate!
      super
      help! "You must provide the URL to a git repository" unless @url
    end
    
    def run
      Sources.add(@url)
    end
  end
end