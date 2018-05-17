Rails.application.routes.draw do
  root 'static#index'
  scope "/:locale", locale: /#{I18n.available_locales.join("|")}/ do
    get 'customers/show'

    # logowanie
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'

    # loty
    get '/flights', to: 'flights#index'
    match 'search(/:search)', to: 'flights#search', as: :search, via: [:get, :post]


    get '/confirm_account/:token', to: 'customers#confirm_email', as: 'confirm_account'
    get '/registration_confirm/:email', to: 'static#registration_confirm', as: 'registration_confirm', constraints: {email: /[^\/]+/}

    # newsy
    resources :news

    # klienci
    resources :customers, only: [:show, :new, :create, :update]
  end

  # google+
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: redirect('/')

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
