require 'rails_helper'

describe 'As a user' do
  describe 'when user clicks on checkout for cart' do
    it 'redirects user to dashboard' do
      user = create(:user)
      item_1 = Item.create(title: "Handlebars", price: "35.00", image: './assets/bike_gear.jpg', description: 'Use to steer your bike.', status: 0)
      item_2 = Item.create(title: "Pedals", price: "12.50", image: './assets/bike_gear.jpg', description: 'Use to make your bike go.', status: 0)

      visit bike_shop_path

      within "#item-#{item_1.id}" do
        click_on('Add to Cart')
      end

      within "#item-#{item_2.id}" do
        click_on('Add to Cart')
      end

      find("#nav-cart-link").click
      expect(current_path).to eq(carts_path)

      click_on 'Checkout'

      expect(current_path).to eq(dashboard_path)
      expect(flash[:notice]).to eq
      "Successfully submitted your order totaling #{Order.last.total}"
    end
  end
end
