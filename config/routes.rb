Rails.application.routes.draw do
  get 'carts/show', to: 'carts#show', as: 'cart'

  root to: 'items#index'
  resources :order, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
end
