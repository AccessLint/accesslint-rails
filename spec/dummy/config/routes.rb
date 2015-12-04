Rails.application.routes.draw do
  root to: "home#index"
  mount AccessLint::Rails::Engine => "/accesslint/errors"
end
