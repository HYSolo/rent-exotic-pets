Rails.application.routes.draw do
  get 'dashboard', to: 'dashboard#index'
  resources :pets do
    resources :bookings, only: [:new, :create]
  end

  get '/bookings', to: 'bookings#index'
  get '/bookings/:id', to: 'bookings#show', as: 'booking'

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
