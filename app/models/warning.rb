module AccessLint
  module Rails
    class Warning
      def initialize(violation)
        @violation = violation
      end

      def message
        [help_text, target_nodes].join(" - ")
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
