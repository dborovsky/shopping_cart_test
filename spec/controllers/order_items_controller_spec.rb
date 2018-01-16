require 'rails_helper'

RSpec.describe OrderItemsController, type: :controller do
	describe "POST create" do
		before(:each) do
			@order = Order.create()
			@item = Item.create({ id: 1, price: 10 })
		end

		it "should responce with status code 200" do
			params = {
      	"quantity": "1", 
      	"item_id": @item.id 
      } 
    
    	post :create, params: { order_item: params }, as: :js
			response.code.should eq '200'
		end
	end
end
