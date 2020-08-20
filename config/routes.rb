Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: [:new, :create, :show] do
    resources :cars, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :cars, only: [:index, :show] do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:show] do
    resources :reviews, only: [:create]
  end

  get "/dashboard", to: "pages#dashboard", as: :dashboard
end
