Rails.application.routes.draw do
  devise_for :users
  match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user
  resources :users
  root to: 'pages#home'

  get 'profile', to: 'profiles#show'

  resource :cart, only: [:show]
  resources :order_items
  resources :admin
  resources :profile, only: :show
  resources :products do
    resources :reviews, only: :create
  end
  resources :categories

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
