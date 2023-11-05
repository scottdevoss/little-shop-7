Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"


  namespace :admin do
    resources :merchants, only: [:create, :new, :index, :show, :edit, :update], controller: "merchants"
    resources :invoices, only: [:index, :show]
  end

  get "/merchants/:id/dashboard", to: "merchants#show"
  
  get "/merchants/:id/items", to: "merchant_items#index"
  get "/merchants/:id/items/new", to: "merchant_items#new"
  get "/merchants/:id/items/:item_id", to: "merchant_items#show"
  post "/merchants/:id/items", to: "merchant_items#create"
  # get "/merchants/:id/items/:item_id/edit", to: "merchant_items#edit"
  resources :merchants do
    resources :items, only: [:edit, :update], controller: "merchant_items"
    resources :invoices, only: [:show], controller: "merchant_invoices"
  end
  get "/merchants/:id/invoices", to: "merchant_invoices#index"

  resources :items

  get "/admin", to: "admin#index"
   
end
