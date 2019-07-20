Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

  root 'top#home'
  get '/help',  to: 'top#help'
  get '/about', to: 'top#about'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:index, :create, :destroy]
  resources :relationships,       only: [:create, :destroy]
end
