class OrderItemsController < ApplicationController
	
	def create
		order = current_order
		order.add_item_to_order(order_item_params) 
				
		session[:order_id] = order.id
	end

	private

	def order_item_params
    params.require(:order_item).permit(:quantity, :item_id)
  end
end
