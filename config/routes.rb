Rails.application.routes.draw do
  get 'users/new', to: 'posts#new'
  post 'users/new', to: 'posts#create', as: 'create_post'

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end
end
