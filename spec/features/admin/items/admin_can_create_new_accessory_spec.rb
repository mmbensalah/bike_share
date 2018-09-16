require 'rails_helper'

describe 'As an admin' do
  describe 'on the admin/acc/new page' do
    it 'admin can create new accessory/item' do
      admin = create(:user, role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      title = 'helmet'
      price = 10
      description = 'makes you look cool and keeps you safe'
      image = 'bike_gear.jpg'
      status = 'active'

      visit new_admin_item_path
      fill_in :item_title, with: title
      fill_in :item_price, with: price
      fill_in :item_description, with: description
      fill_in :item_image, with: image
      fill_in :item_status, with: status

      click_on('Create Item')
      expect(current_path).to eq item_path(Item.last.id)
      expect(page).to have_content(title)
      expect(page).to have_content(price)
      expect(page).to have_content(description)
      expect(page).to have_content("Item #{Item.last.title} has been successfully created!")
    end
  end
end
