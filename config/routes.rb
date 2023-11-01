Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"


  namespace :admin do
    resources :merchants, only: [:index, :show]
  end

  get "/merchants/:id/dashboard", to: "merchants#show"

  get "/merchants/:id/items", to: "merchant_items#index"
  get "/merchants/:id/items/:item_id", to: "merchant_items#show"
  get "/merchants/:id/invoices", to: "merchant_invoices#show"

  get "/admin", to: "admin#index"
end
