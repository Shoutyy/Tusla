Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'profile', to: 'profiles#show'

  resources :admin
  resources :profile, only: :show
  resources :products
  resources :categories

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
