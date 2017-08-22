Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  resources :destinations
  resources :uber_routes
end
