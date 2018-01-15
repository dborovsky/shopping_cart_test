class Order < ApplicationRecord
	has_many :order_items

	before_save :update_total

	def total
		order_items.all.collect { |i| i.total_price }.sum
	end

	def add_item_to_order(order_item_params)
		order_item = order_items.find_by(item_id: order_item_params[:item_id])
		if order_item
			order_item.quantity += order_item_params[:quantity].to_i
			order_item.save
		else
			order_item = order_items.build(order_item_params)		 	
		end

		self.save 
  end

	private

	def update_total
		self[:total] = total
	end
end
