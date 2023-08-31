Rails.application.routes.draw do
  devise_for :users
  get 'users/new', to: 'posts#new', as: 'new'
  post 'users/new', to: 'posts#create', as: 'create_post'
  root 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts
  end
  resources :comments, only: [:destroy]
  post 'comments/:id', to: 'comments#create', as: 'create_comment'

  post 'likes/:id', to: 'likes#create', as: 'create_like'

  namespace :api do
    namespace :v1 do

      resources :users do
        resources :posts do
          resources :comments
        end
      end
      
      root 'users#index'
    end
  end
end
