Rails.application.routes.draw do

  get '/login', to: 'sessions#new', as: :login

  get 'sessions/destroy'

  resources :users

  # get 'users/new'

  # get 'users/create'

  get '/home', to: 'home#index', as: :home

  root 'users#new'

end
