class OrderItemsController < ApplicationController
	before_action :set_order, only: [ :create ]

	def create
		@order.add_item(params)
		@order_item = @order.order_items.new(order_item_params)
		@order.save
		session[:order_id] = @order.id
	end

	private

	def set_order
		@order = Order.find(session[:order_id])
		rescue ActiveRecord::RecordNotFound
			@order = Order.create
			session[:order_id] = @order.id
		end 
	end

end
