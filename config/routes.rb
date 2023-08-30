Rails.application.routes.draw do
  devise_for :users
  get 'users/new', to: 'posts#new', as: 'new'
  post 'users/new', to: 'posts#create', as: 'create_post'
  # post 'users/:user_id/posts/:id/create_comment', to: 'posts#create_comment', as: 'create_comment'
  # post 'users/:user_id/posts/:id/create_like', to: 'posts#create_like', as: 'create_like'
  root 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts
  end
  resources :comments, only: [:destroy]
  post 'comments/:id', to: 'comments#create', as: 'create_comment'

  post 'likes/:id', to: 'likes#create', as: 'create_like'
end
