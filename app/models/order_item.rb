class OrderItem < ApplicationRecord
  belongs_to :item
  belongs_to :order

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  
  before_save :update_total_price  

  def total_price
  	item.price * quantity
  end

  private

  def item_present
    if item.nil?
      errors.add(:item, "is not valid.")
    end
  end

  def order_present
    if order.nil?
      errors.add(:order, "is not a valid order.")
    end
  end

  def update_total_price
  	self[:total_price] = total_price
  end
end
