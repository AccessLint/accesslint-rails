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
        accesslint_params.fetch(:violations)
      end

      def accesslint_params
        params.require(:accesslint)
      end

      def url
        URI.parse(accesslint_params.fetch(:url))
      end

      def logger
        @logger ||= ActiveSupport::TaggedLogging.new(::Rails.logger)
      end
    end
  end
end
