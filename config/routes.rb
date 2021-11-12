Rails.application.routes.draw do
  resources :games
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :users, only: [:show, :index]
  resources :trips
  resources :games, path: 'sessions', as: 'sessions'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'main#index'
end
