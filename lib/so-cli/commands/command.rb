require 'claide'

require 'so-cli/info'
require 'so-cli/settings'

module SoCli
  class Command < CLAide::Command
    self.abstract_command = true
    self.command = "so"
    self.version = VERSION
    self.description = SUMMARY
    
    def initialize(argv)
      Settings.instance.verbose |= argv.flag?("verbose") ? true : false
      super
    end
  end
end