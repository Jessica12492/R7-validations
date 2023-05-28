Rails.application.routes.draw do
 
  #get "orders/show", to: "order#show"
  #get "orders/edit", to: "order#edit"
  #get "orders/create", to: "order#create"
  #get "orders/update", to: "order#update"
  #get "orders/destroy", to: "order#destroy"

  root to: "orders#index"
  

  resources :orders

  resources :customers
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
