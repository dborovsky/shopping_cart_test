Rails.application.routes.draw do
  root to: 'pages#index'

  post "/order_items", to: "order_items#create"  
end
