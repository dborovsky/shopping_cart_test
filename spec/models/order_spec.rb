require 'rails_helper'

RSpec.describe Order, type: :model do
  before(:each) do
		@order = Order.create()
		@item = Item.create({ id: 1, price: 10 })
	end

  it "should return correct number order_items" do
  	@order.add_item_to_order({ item_id: @item.id, quantity: 1 })
		@order.add_item_to_order({ item_id: @item.id, quantity: 1 })
		
		expect(@order.order_items.length).to eq 1
  end

  it "order should return correct total" do
  	@order.add_item_to_order({ item_id: @item.id, quantity: 2 })
  	@order.add_item_to_order({ item_id: @item.id, quantity: 4 })

		expect(@order.total).to eq 60 
  end
end
