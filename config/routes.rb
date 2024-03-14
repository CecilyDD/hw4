# config/routes.rb
Rails.application.routes.draw do
  # Authentication routes
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  # Resourceful routes for places and entries
  resources :places do
    resources :entries
  end

  # Set root path
  root 'places#index'
end
