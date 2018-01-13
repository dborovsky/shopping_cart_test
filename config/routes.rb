Rails.application.routes.draw do
  get 'carts/show'

  root to: 'pages#index'
  resources :order, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
end
