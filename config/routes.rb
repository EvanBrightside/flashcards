Rails.application.routes.draw do
  get 'oauths/oauth'

  get 'oauths/callback'

  root "home#index"

  resources :cards
  resources :home
  resources :users
  resources :sessions, only: %i(new create destroy)

  post '/check', to: 'home#perform'
  get '/sign_up', to: 'users#new', as: :sign_up
  get '/log_in', to: 'sessions#new', as: :log_in
  delete '/', to: 'sessions#destroy', as: :log_out

  post "oauth/callback" => "oauths#callback"
  get "oauth/callback" => "oauths#callback" # for use with Github, Facebook
  get "oauth/:provider" => "oauths#oauth", as: :auth_at_provider
end
