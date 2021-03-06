Rails.application.routes.draw do
  root 'users#new'

  get '/login', to: 'sessions#new', as: :login

  get '/logout', to: 'sessions#destroy', as: :logout

  resources :users, only: [:create]
  resources :sessions, only: [:new, :create]

  #get 'users/new'

  # get 'users/create'

  get '/home', to: 'home#index', as: :home


end
