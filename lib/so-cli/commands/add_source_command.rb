require_relative 'command'

module SoCli
  class AddSourceCommand < Command
    self.command = "add-source"
    self.summary = "Add an action source."
    
    def self.options
      [['<repo_url>', 'The url of a repository containing so-cli actions at its root.']].concat(super)
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
      puts "Adding source #{@url}"
    end
  end
end