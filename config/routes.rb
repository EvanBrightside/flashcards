Rails.application.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do
    get 'oauths/oauth'

    get 'oauths/callback'

    root 'dashboard/home#index'

    scope module: 'dashboard' do
      resources :cards, :decks, :home
      resources :users, only: %i(show edit update)
    end

    resources :users, only: %i(new create)
    resources :sessions, only: %i(new create destroy)

    post '/check', to: 'dashboard/home#perform'
    get '/sign_up', to: 'users#new', as: :sign_up
    get '/sessions', to: 'sessions#new'
    get '/log_in', to: 'sessions#new', as: :log_in
    delete '/', to: 'sessions#destroy', as: :log_out

    post "oauth/callback" => "oauths#callback"
    get "oauth/callback" => "oauths#callback" # for use with Github, Facebook
    get "oauth/:provider" => "oauths#oauth", as: :auth_at_provider
  end
end
