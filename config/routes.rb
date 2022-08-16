Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :users, only: [:show]
  get 'users/:id/friends' => 'users#index', as: 'user_friends'

  resources :friend_requests, only: [:create]
  delete 'friend_requests/:id/delete' => 'friend_requests#destroy', as: 'friend_requests_delete'
  get 'friend_requests/:id/delete' => 'friend_requests#destroy'
  get 'friend_requests' => 'friend_requests#create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :posts, except: [:destroy]
  delete 'posts/:id/delete' => 'posts#destroy', as: 'posts_delete'
  get 'posts/:id/delete' => 'posts#destroy'

  resources :comments, except: [:destroy]
  delete 'comments/:id/delete' => 'comments#destroy', as: 'comments_delete'
  get 'comments/:id/delete' => 'comments#destroy'
  
  root "posts#index"
end
