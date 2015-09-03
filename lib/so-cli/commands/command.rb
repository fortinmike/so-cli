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
      @settings = Settings.new
      
      @settings.verbose |= argv.flag?('verbose') ? true : false
      
      first_run = !File.exist?(@settings.config_file)
      
      initialize_config(first_run)
      initialize_sources(@config)
      initialize_output(argv)
      
      @sources.update if first_run
      
      super
    end
    
    def initialize_config(first_run)
      @config = Config.new(@settings)
      @config.first_run_initialization if first_run
      @config.load
    end
    
    def initialize_sources(config)
      @sources = Sources.new(@settings.sources_directory, config)
    end
    
    def initialize_output(argv)
      @output = Outputs.output_named(argv.flag?('output'))
      @output = $stdout.isatty ? SoCli::ShellOutput.new : SoCli::AlfredXmlOutput.new unless @output
    end
  end
end