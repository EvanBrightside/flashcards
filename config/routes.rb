Rails.application.routes.draw do
  root "home#index"

  resources :cards
  resources :home

  post '/check' => 'home#perform'
end
