require "rails_helper"

describe "As a visitor" do
  describe "when I visit '/bike-shop'" do
    it "should show items for sale" do
      items = create_list(:item, 12)

      visit bike_shop_path

      expect(page).to have_css(".item"), minimum: 12
      expect(page).to have_content(items.first.title)
      expect(page).to have_content(items.first.price)
      expect(page).to have_content(items.first.description)
      expect(page).to have_content(items.second.title)
      expect(page).to have_content(items.last.title)
      expect(page).to have_button("Add to Cart")
    end
  end
end
