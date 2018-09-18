require 'rails_helper'

describe 'visitor can change cart quantities' do
  describe 'visitor changes the quantity to and clicks update' do
    it 'increases cart quantity by one' do
      item_1 = Item.create(title: "Handlebars", price: "35.00", image: 'bike_gear.jpg', description: 'Use to steer your bike.', status: 0)
      item_2 = Item.create(title: "Test", price: "45.00", image: 'bike_gear.jpg', description: 'Use to steer your bike.', status: 0)

      visit bike_shop_path

      within("#item-#{item_1.id}") do
        click_on("Add to Cart")
      end


      visit cart_path
      within("#cart-item-1") do
        fill_in :quantity, with: 2
      end

      click_on "Update Quantity"

      expect(page).to have_content("Quantity: 2")

      within("#cart-item-1") do
        fill_in :quantity, with: 99
      end

      click_on "Update Quantity"

      expect(page).to have_content("Quantity: 99")

      within("#cart-item-1") do
        fill_in :quantity, with: 1
      end

      click_on "Update Quantity"

      expect(page).to have_content("Quantity: 1")
    end
  end
end
