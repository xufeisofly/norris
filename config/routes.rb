# frozen_string_literal: true

Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
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

  namespace :games do
    resources :blue_space_conversations
    resources :blue_space_scenes
  end
end
