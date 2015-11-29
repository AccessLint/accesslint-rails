module AccessLint
  module Rails
    class ErrorsController < AccessLint::Rails::ApplicationController
      def create
        head :ok
      end
    end
  end
end
