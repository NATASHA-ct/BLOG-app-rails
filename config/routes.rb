Rails.application.routes.draw do
  devise_for :admins
    root 'users#index'
    
    resources :users, only: [:index, :show] do
      resources :posts, only: [:index, :new, :create, :show ] 
      resources :comments, only: [:create]
      resources :likes, only: [:create]
    end
end
