Rails.application.routes.draw do
    root 'users#index'
    resources :users, only: [:index, :show] do
      resources :posts, only: [:index,:show] 
      resources :posts, only: [:index, :new, :create, :show ] 
        resources :comments, only: [:create]
        resources :likes, only: [:create]
    end
end
