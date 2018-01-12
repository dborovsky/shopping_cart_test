require "rails_helper"

feature "home page with correct credentials" do
	scenario "Home page has correct title" do
		visit("/")
		expect(page).to have_content("Product`s list")
	end 
end