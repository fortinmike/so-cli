require_relative 'alfred_xml_output'
require_relative 'shell_output'

module SoCli
  class Outputs
    def self.output_named(name)
      case name
      when 'alfred-xml'; SoCli::AlfredXmlOutput.new
      when 'shell'; SoCli::ShellOutput.new
      else; nil
      end
    end
  end
end