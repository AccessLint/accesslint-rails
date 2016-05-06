Rails.application.routes.draw do
  root to: "home#index"

  mount AccessLint::Rails::Engine, at: "access_lint"
end
