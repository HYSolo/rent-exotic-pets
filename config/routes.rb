Rails.application.routes.draw do
  get 'pets/index'
  get 'pets/new'
  get 'pets/show'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
