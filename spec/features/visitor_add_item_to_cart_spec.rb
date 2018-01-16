require 'rails_helper'

feature "visitor add item to cart" do
	scenario "after adding to cart user should be stay on home page" do
		visit("/")
		within first(".item") do
			click_button("Add to cart")
		end
		expect(current_path).to eq(root_path)
	end

	scenario "after adding to cart must rerender cart text with new values" do
		visit("/")
		within first(".item") do
			fill_in "order_item[quantity]", with: '5'
			click_button("Add to cart")
		end
		expect(current_path).to have_text("5 Items in Cart")
	end
end