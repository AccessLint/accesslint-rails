AccessLint::Rails::Engine.routes.draw do
  resources :errors, only: :create
end
