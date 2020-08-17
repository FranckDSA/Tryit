Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cars, only: [:index, :show, :edit, :update, :destroy] do
    resources :bookings, only: [:new, :create]
  end

  resources :users, only: [:new, :create] do
    resources :cars, only: [:new, :create]
  end

  get "/dashboard", to: "pages#dashboard", as: :dashboard
end
