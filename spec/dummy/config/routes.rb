Rails.application.routes.draw do
  if Rails.env.test? || Rails.env.development?
    mount AccessLint::Rails::Engine, at: "access_lint"
  end
  root to: "home#index"
end
