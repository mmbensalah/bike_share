require "rails_helper"

describe "As a visitor" do
  describe "when I visit the items page" do
    it 'I can view a single item' do
      item_1, item_2 = create_list(:item, 2)

      visit items_path

      within("#item-#{item_1.id}") do
        click_on(item_1.title)
      end

      expect(current_path).to eq(item_path(item_1))
      expect(page).to have_content(item_1.title)
      expect(page).to_not have_content(item_2.title)
      expect(page).to have_content("Price: $#{item_1.price}")
      expect(page).to have_content(item_1.description)
    end
  end
end
