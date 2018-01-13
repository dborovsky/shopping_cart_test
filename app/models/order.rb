class Order < ApplicationRecord
	has_many :order_items

	before_save :update_total

	def total
		order_items.collect { |i| i.total_price * i.quantity }.sum 
	end

	def add_item_to_order(order_item_params)
		order_item = self.order_items.find_by(item_id: order_item_params[:item_id])
		if order_item
			order_item.quantity += order_item_params[:quantity].to_i
		else
			order_item = self.order_items.new(order_item_params)		 	
		end

		self.save 
  end

	private

	def update_total
		self[:total] = total
	end
end
