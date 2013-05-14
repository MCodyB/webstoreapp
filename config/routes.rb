WebstoreApp::Application.routes.draw do
  root to: "users#new"

  resource :session, only: [:new, :create, :destroy]
  resources :users
  resource :cart, except: [:new, :edit, :create]
  resources :products
  resources :orders, only: [:new, :create, :show]

  resource :cart do
    member do
      post "add"
    end
  end

  match "/signup", to: "users#new"
  match "/signin", to: "sessions#new"
  match "/signout", to: "sessions#destroy"
  match '/checkout', to: "carts#index"

end
