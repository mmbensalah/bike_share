require 'rails_helper'

describe 'As a user' do
  describe 'when user clicks on add item' do
    it 'item will be added to cart' do
      item_1 = Item.create(title: "Handlebars", price: "35.00", image: 'bike_gear.jpg', description: 'Use to steer your bike.', status: 0)
      item_2 = Item.create(title: "Pedals", price: "12.50", image: 'bike_gear.jpg', description: 'Use to make your bike go.', status: 0)
      user = create(:user)

      visit bike_shop_path

      within "#item-#{item_1.id}" do
        click_on("Add to Cart")
      end
      within("#item-#{item_2.id}") do
        click_on("Add to Cart")
      end

      find("#nav-cart-link").click

      expect(current_path).to eq(carts_path)
      within("#cart-item-#{item_1.id}") do
        expect(page).to have_content(item_1.title)
        expect(page).to have_content(item_1.price)
        expect(page).to have_content("Quantity: 1")
        expect(page).to have_content("Subtotal: $35.00")
      end
      within("#cart-item-#{item_2.id}") do
        expect(page).to have_content(item_2.title)
        expect(page).to have_content(item_2.price)
        expect(page).to have_content("Quantity: 1")
        expect(page).to have_content("Subtotal: $12.50")
      end
      expect(page).to have_content("Your current cart total: $47.50")
      expect(page).to have_button("Checkout")
    end
  end
end
