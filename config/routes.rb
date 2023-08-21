Rails.application.routes.draw do
  get 'users/new', to: 'posts#new'
  post 'users/new', to: 'posts#create', as: 'create_post'
  post 'users/:user_id/posts/:id/create_comment', to: 'posts#create_comment', as: 'create_comment'
  post 'users/:user_id/posts/:id/create_like', to: 'posts#create_like', as: 'create_like'
  
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end
end
