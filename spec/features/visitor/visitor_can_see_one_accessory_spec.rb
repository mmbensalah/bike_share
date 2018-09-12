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

      expect(current_path).to eq(items_path)
      expect(page).to have_content("Cart: 1")
      expect(page).to have_content("You have successfully added #{item.title} to your cart.")
    end
  end
end
