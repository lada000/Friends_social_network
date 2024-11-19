Rails.application.routes.draw do
  root to: "home#index"

  get "up" => "rails/health#show", as: :rails_health_check

  devise_for :users, controllers: { registrations: 'users/registrations' }

  resource :profile, only: [:show, :edit, :update]
  
  get 'home/index'

  post "/ping", to: "users#ping"
end
