Rails.application.routes.draw do

  root to: "creatures#index"

  resources :creatures, only: [:index, :show]
  resources :types, only: [:show]
  resources :carts, only: [:create, :index]
  
  get "/#{types}"

end