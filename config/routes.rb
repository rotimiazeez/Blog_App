Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'users#index'

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show] 
  end

  resources :posts, only: [:new, :create, :destroy] do
    resources :comments, only: [:create]
    resources :likes, only: [:create]
  end

  resources :comments, only: [:destroy]

  namespace :api, defaults: { format: :json } do
    resources :posts, only: [:index] do
      resources :comments, only: [:create, :index]
    end
  end
end
