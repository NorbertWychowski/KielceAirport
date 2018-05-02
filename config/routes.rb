Rails.application.routes.draw do
  root 'static#index'

  # logowanie
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  # google+
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')

  get 'register', to: 'customers#new'
  post 'register', to: 'customers#create'

  get 'confirm_account/:token', to: 'customers#confirm_email', as: 'confirm_account'
  get 'registration_confirm/:email', to: 'static#registration_confirm', as: 'registration_confirm'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
