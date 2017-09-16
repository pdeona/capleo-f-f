Rails.application.routes.draw do



  root :to => 'sessions#new'

  get 'login', { controller: :sessions, action: 'new' }
  post 'login', { controller: :sessions, action: 'create' }

  delete 'logout', { controller: :sessions, action: 'destroy' }

  get 'signup', { controller: :users, action: 'new' }
  post 'signup', { controller: :users, action: 'create' }

  resources :products, only: :index

  resources :cart_items, only: [:create, :destroy]

  resources :users

  get 'spotify_search', to: 'spotify_request#search'

  get 'playlist/create', to: 'spotify_request#playlist_create'
  get 'auth/spotify', as: 'spotify_login'
  get 'auth/spotify/callback', to: 'spotify_request#checkout'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
