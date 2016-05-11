module AccessLint
  module Rails
    class Warning
      def initialize(violation)
        @violation = violation
      end

      def message
        I18n.t("warning.message", help_text: help_text, nodes: target_nodes)
      end

      private

      attr_reader :violation

      def help_text
        violation["help"]
      end

      def target_nodes
        violation["nodes"].collect { |node| node["target"] }
      end
    end
  end
end
