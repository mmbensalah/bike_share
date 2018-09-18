require 'rails_helper'

describe 'As a visitor' do
  describe 'on the cart page' do
    it 'can remove an item' do
      item_1 = Item.create(title: "Handlebars", price: "35.00", image: 'bike_gear.jpg', description: 'Use to steer your bike.', status: 0)
      item_2 = Item.create(title: "Pedals", price: "12.50", image: 'bike_gear.jpg', description: 'Use to make your bike go.', status: 0)

      visit bike_shop_path

      within("#item-#{item_1.id}") do
        click_on("Add to Cart")
      end

      within("#item-#{item_2.id}") do
        click_on("Add to Cart")
      end
      find("#nav-cart-link").click

      within("#cart-item-#{item_1.id}") do
        click_on('Remove from cart')
      end

      expect(current_path).to eq(cart_path)

      expect(page).to have_link(item_1.title)
      expect(page).to have_content("#{item_1.title} removed from cart.")
      expect(page).to_not have_content(item_1.description)
    end
  end
end
