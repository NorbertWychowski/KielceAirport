Rails.application.routes.draw do
  root 'static#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'register', to: 'customers#new'
  post 'register', to: 'customers#create'

  get 'confirm_account/:token', to: 'customers#confirm_email', as: 'confirm_account'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
