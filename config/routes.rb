Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :costumes, only: [:index, :new, :create] do
    resources :bookings, only: [:new, :create]
  end
  resources :user, only: [:index, :new, :create]
  resources :bookings, only: [:show, :index]
end
