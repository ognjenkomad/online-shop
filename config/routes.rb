Rails.application.routes.draw do
  resources :addresses
  root to: 'articles#index'

  resources :articles do
    member do
      post :add_to_cart
      post :decrease_from_cart
      delete :remove_from_cart
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'signup', to: 'users#new'
  resources :users, except: [:new] do 
    member do
      resources :shopping_carts
      resources :orders
    end
  end

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  post 'logout', to: 'sessions#destroy'
end
