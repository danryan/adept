module Adept
  module Support
    class Control

      attr_accessor :file, :stanza, :raw

      def regex
        @regex ||= {}
        @regex[:comment] = /^#.*$/
        @regex[:blank_line] = /^\s\..*$/
        @regex[:simple_field] = /^([^\cA-\cZ\s:]+):\s*(.*)$/
        @regex[:continuation_line] = /^(\s+)(.*)$/
        @regex
      end

      def initialize(path)
        @file = File.open(path)
        @raw = File.open(path).read
        @stanza = {}
      end

      def parse
        current_field = nil
        is_multiline = false
        current_line = 0
        previous_line = nil

        file.each_line do |line|
          line.gsub!("\r", "")
          current_line += 1

          next if line =~ regex[:comment]

          # if previous_line && previous_line.strip.length == 0 && line !~ regex[:continuation_line]
          #   stanza = {}
          #   current_field = nil
          #   is_multiline = false
          # end

          previous_line = line

          if line =~ regex[:blank_line]
            # warn "Blank continuation line without originating field"
            is_multiline = true
            stanza[current_field] += "\n ."
          elsif matches = line.match(regex[:continuation_line])
            # warn "Continuation line without originating field." unless current_field
            is_multiline = true
            line = matches[1] + matches[2]
            stanza[current_field] += "\n#{line}"
          elsif matches = line.match(regex[:simple_field])
            name, value = matches.to_a[1,2]
            if current_field && !is_multiline
              stanza[current_field] = stanza[current_field] ? stanza[current_field].strip : ""
              is_multiline = false
            end
            stanza[current_field = name] = value
          end
        end

        stanza
      end
    end
  end
end
