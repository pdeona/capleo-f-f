Rails.application.routes.draw do

  root :to => 'sessions#new'

  get 'login', { controller: :sessions, action: 'new' }
  post 'login', { controller: :sessions, action: 'create' }

  delete 'logout', { controller: :sessions, action: 'destroy' }

  get 'signup', { controller: :users, action: 'new' }
  post 'signup', { controller: :users, action: 'create' }

  resources :products do
    resources :cart_items
  end

  resources :users

  resources :cart, only: [:show]

  resources :cart_items, only: [:create, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
