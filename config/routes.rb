Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'profile', to: 'profile#show'

  resources :profile, only: :show
  resources :products do
    resources :review, only: :create
  end

  resources :reviews, only: :destroy
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
