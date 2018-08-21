Rails.application.routes.draw do

  resources :users

  # get 'users/new'

  # get 'users/create'

  root 'home#index'

end
