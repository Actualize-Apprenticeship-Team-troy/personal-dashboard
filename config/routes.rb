Rails.application.routes.draw do

  resources :users

  # get 'users/new'

  # get 'users/create'

  get '/home', to: 'home#index', as: :home

  root 'users#new'

end
