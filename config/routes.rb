Rails.application.routes.draw do
  default_url_options :host => "localhost:3000"

  root to: 'posts#index'

  devise_for :users

  resources :posts

  namespace :accounts do
    resource :github, only: [] do
      collection do
        get 'login', to: 'githubs#authorization'
        get 'access_token'
      end
    end
  end
end
