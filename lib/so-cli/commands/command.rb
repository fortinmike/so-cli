require 'claide'

require 'so-cli/info'
require 'so-cli/config'
require 'so-cli/settings'
require 'so-cli/outputs/outputs'
require 'so-cli/sources/sources'

module SoCli
  class Command < CLAide::Command
    self.abstract_command = true
    self.command = "so"
    self.version = VERSION
    self.description = SUMMARY
    
    def initialize(argv)
      Settings.instance.verbose |= argv.flag?('verbose') ? true : false
      initialize_sources(Config.new)
      initialize_output(argv)
      super
    end
    
    def initialize_sources(config)
      @sources = Sources.new(Settings.instance.sources_directory, config)
    end
    
    def initialize_output(argv)
      @output = Outputs.output_named(argv.flag?('output'))
      @output = $stdout.isatty ? SoCli::ShellOutput.new : SoCli::AlfredXmlOutput.new unless @output
    end
  end
end