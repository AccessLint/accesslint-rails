module AccessLint
  module Rails
    class Warning
      def initialize(path, violation)
        @path = path
        @violation = violation
      end

      def message
        I18n.t(
          "warning.message",
          path: path,
          help_text: help_text,
          level: level,
          nodes: target_nodes
        )
      end

      private

      attr_reader :path, :violation

      def level
        violation["impact"]
      end

      def help_text
        violation["help"]
      end

      def target_nodes
        violation["nodes"].collect { |node| node["target"] }
      end
    end
  end
end
