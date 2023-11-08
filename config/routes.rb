Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/admin/invoices", to: "admin/invoices#index"
  get "/admin/merchants", to: "admin/merchants#index"
  get "/admin", to: "admin#index"

  namespace :admin do
    resources :merchants, except: [:destroy, :index], controller: "merchants"
    resources :invoices, only: [:show]
  end
  
  resources :items, only: [:index, :show, :update]


  get "/merchants/:id/dashboard", to: "merchants#show"
  resources :merchants do
    resources :items, only: [:index, :new, :edit, :show, :update, :create], controller: "merchant_items"
    resources :invoices, only: [:index, :show, :update], controller: "merchant_invoices"
  end
  
  
  # get "/merchants/:id/invoices", to: "merchant_invoices#index"
  # get "/merchants/:id/items", to: "merchant_items#index"
  # get "/merchants/:id/items/new", to: "merchant_items#new"
  # get "/merchants/:id/items/:item_id", to: "merchant_items#show"
  # post "/merchants/:id/items", to: "merchant_items#create"
  # get "/merchants/:id/items/:item_id/edit", to: "merchant_items#edit"


    
end
