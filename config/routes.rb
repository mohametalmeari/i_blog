Rails.application.routes.draw do
  get 'users/:user_id/posts', to: 'posts#index', as: 'posts'
  get 'users/:user_id/posts/:id', to: 'posts#show', as: 'post'
  get 'users', to: 'users#index', as: 'users'
  get 'users/:id', to: 'users#show', as: 'user'
end
