WebstoreApp::Application.routes.draw do
  root to: "users#new"

  resource :session, only: [:new, :create, :destroy]
  resources :users

  match "/signup", to: "users#new"
  match "/signin", to: "sessions#new"

end
