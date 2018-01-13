Rails.application.routes.draw do
  get 'carts/show'

  root to: 'items#index'
  resources :order, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
end
