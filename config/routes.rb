Rails.application.routes.draw do
  root "home#index"

  resources :cards
  resources :home

  post "/" => "home#perform"
end
