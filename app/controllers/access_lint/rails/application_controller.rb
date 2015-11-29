module AccessLint
  module Rails
    class ApplicationController < ActionController::Base
      protect_from_forgery
    end
  end
end
