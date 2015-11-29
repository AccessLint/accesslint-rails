AccessLintRails::Engine.routes.draw do
  resources :errors, only: :create
end
