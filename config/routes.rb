# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'posts#index'

  resources :posts

  namespace :accounts do
    resource :github, only: [] do
      collection do
        get 'authorization'
        get 'login'
      end
    end
  end

  resources :comments, only: [:create]
end
