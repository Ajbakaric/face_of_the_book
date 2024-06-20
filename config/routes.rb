# config/routes.rb
Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :posts do
    member do
      post 'like'
      delete 'unlike'
    end
    resources :comments, only: [:create]
  end
  resources :users, only: [:index] do
    member do
      get 'profile', to: 'profiles#show'
    end
  end
  resources :follow_requests, only: [:create]
end
