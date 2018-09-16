require "rails_helper"

describe "As a visitor" do
  describe "when I visit the items page" do
    it 'I can view a single item' do
      item_1, item_2 = create_list(:item, 2)

      visit bike_shop_path

      within("#item-#{item_1.id}") do
        click_on(item_1.title)
      end

      expect(current_path).to eq(item_path(item_1))
      expect(page).to have_content(item_1.title)
      expect(page).to_not have_content(item_2.title)
      expect(page).to have_content("Price: $#{item_1.price}")
      expect(page).to have_content(item_1.description)
    end

    it 'should be able to add that item to cart' do
      item = create(:item)

      visit item_path(item)
      expect(page).to have_content("Cart: 0")

      click_on("Add to Cart")

      expect(current_path).to eq(bike_shop_path)
      expect(page).to have_content("Cart: 1")
      expect(page).to have_content("You have successfully added #{item.title} to your cart.")

      find("#nav-cart-link").click
      expect(page).to have_content(item.title)
    end

    it 'should show a retired item' do
      item = create(:item, status: 1)

      visit item_path(item)

      expect(page).to have_content("Item Retired")
      expect(page).to_not have_content("Add to Cart")
    end

    it 'should link back to bike_shop_path' do
      item = create(:item, status: 1)

      visit item_path(item)
      click_on("Back to Bike Shop")
      expect(current_path).to eq(bike_shop_path)
    end
  end
end
