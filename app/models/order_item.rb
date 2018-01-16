class OrderItem < ApplicationRecord
  belongs_to :item
  belongs_to :order

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  
  before_save :update_total_price  

  def total_price
    item.price * quantity
  end

  private

  def update_total_price
    self[:total_price] = item.price * quantity
  end
end
