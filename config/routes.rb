WebstoreApp::Application.routes.draw do
  root to: "users#new"

  resource :session, only: [:new, :create, :destroy]
  resources :users
  resource :cart, except: [:new, :edit, :create]
  resources :products, only: [:index]

  match "/signup", to: "users#new"
  match "/signin", to: "sessions#new"
  match "/signout", to: "sessions#destroy"

end
