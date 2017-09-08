Rails.application.routes.draw do
  get 'login', { controller: :sessions, action: 'new' }
  post 'login', { controller: :sessions, action: 'create' }

  delete 'logout', { controller: :sessions, action: 'destroy' }

  get 'signup_path', { controller: :users, action: 'new' }
  post 'signup_path', {controller: :users, action: 'create'}

  resources :products do
    resources :reviews
  end

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
