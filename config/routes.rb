Rails.application.routes.draw do
  devise_for :users
  root to: 'costumes#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :costumes, only: [:index, :new, :create ,:show, :destroy] do
    resources :bookings, only: [:new, :create]
  end
  resources :user, only: [:index, :show, :new, :create]
  resources :bookings, only: [:show, :index]
end
