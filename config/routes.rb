Rails.application.routes.draw do

  root to: "creatures#index"

  resources :creatures, only: [:index, :show]
  resources :types, only: [:show]  
  resources :carts, only: [:create, :index]
  
  get "/cart", to: "carts#index"
  get "/:name", to: "types#show"
  get "*path" => redirect('/')
end