require 'rails_helper'

feature "visitor add item to cart" do
	scenario "add item to cart" do
		visit("/")
		within first(".item") do
			click_button("Add to cart")
		end 
		
		expect(current_path).to eq(root_path)
		
		within first(".item") do
			click_button("Add to cart")
		end

		click_link "Cart"

		within(".name") do
			expect(page.body).to have_content("Item 1")
		end

		within(".quantity") do
			expect(page.body).to have_content("2")
		end
	end
end