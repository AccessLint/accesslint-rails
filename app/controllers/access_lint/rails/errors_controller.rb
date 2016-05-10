require "warning"

module AccessLint
  module Rails
    class ErrorsController < ApplicationController
      def create
        warnings.each do |warning|
          logger.tagged("AccessLint") do
            logger.warn("\"#{url}\" - #{warning.message}")
          end
        end

        head :ok
      end

      private

      def warnings
        violations_params.map do |violation|
          Warning.new(violation)
        end
      end

      def violations_params
        params.require(:violations)
      end

      def url
        URI.parse(params.require(:url)).path
      end

      def logger
        @logger ||= ActiveSupport::TaggedLogging.new(::Rails.logger)
      end
    end
  end
end
