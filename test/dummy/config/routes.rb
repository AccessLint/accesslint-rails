Rails.application.routes.draw do

  mount AccessLintRails::Engine => "/access_lint_rails"
end
