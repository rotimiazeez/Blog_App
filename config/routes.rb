Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    root "users#index"

    resources :users, only: [:index, :show] do
      resources :posts, only: [:index, :show]
    end
    
  resources :posts, only: [:new, :create] do
    resources :comments, only: [:create]
    resources :likes, only: [:create]
  end
  end
