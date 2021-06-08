Rails.application.routes.draw do
  resources :pets do
    resources :bookings, only: [:new]
  end
    
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
