class Order < ApplicationRecord
	has_many :order_items

	before_save :update_total

	def total
		order_items.collect { |i| i.price * i.quantity }.sum 
	end

	private

	def update_total
		self(:total) = total
	end

end
