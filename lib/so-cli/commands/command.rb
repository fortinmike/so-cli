require 'claide'

require 'so-cli/info'
require 'so-cli/settings'
require 'so-cli/outputs/outputs'

module SoCli
  class Command < CLAide::Command
    self.abstract_command = true
    self.command = "so"
    self.version = VERSION
    self.description = SUMMARY
    
    def initialize(argv)
      Settings.instance.verbose |= argv.flag?('verbose') ? true : false
      initialize_output(argv)
      super
    end
    
    def initialize_output(argv)
      @output = Outputs.output_named(argv.option('output'))
      @output = $stdout.isatty ? SoCli::ShellOutput.new : SoCli::AlfredXmlOutput.new unless @output
    end
  end
end