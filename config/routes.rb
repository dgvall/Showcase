Rails.application.routes.draw do
  
  resources :tags, only: [:index]
  # resources :artwork_tags, only [:index]
  resources :artworks, only: [:create, :index]
  # resources :users, only: [:show]

  post "/signup", to: "users#create"
  get "/me", to: "users#profile"
  get '/users/:username', to: 'users#show'

  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  # Routing logic: fallback requests for React Router.
  # Leave this here to help deploy your app later!
  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }
end
