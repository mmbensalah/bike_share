require 'rails_helper'

describe 'admin can visit individual order show page' do
  it 'shows all the details for this item' do
    order = create(:order)
    admin = order.user
    order.user.role = 1
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit order_path(order)
    save_and_open_page
    expect(page).to have_content("#{order.user.first_name}")
    expect(page).to have_content("#{order.user.last_name}")
    expect(page).to have_content("#{order.user.address}")
    expect(page).to have_content("#{order.item.name}")
    expect(page).to have_content("#{order.quantity}")
    expect(page).to have_content("#{order_item.price}")
    expect(page).to have_content("#{order.status}")
  end
end
