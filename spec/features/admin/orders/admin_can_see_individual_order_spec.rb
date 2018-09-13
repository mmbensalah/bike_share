require 'rails_helper'

describe 'admin can visit individual order show page' do
  it 'shows all the details for this item' do
    order = create(:order)
    visit order_path(order)

    expect(page).to have_content("#{order.user.name}")
    expect(page).to have_content("#{order.user.address}")
    expect(page).to have_content("#{order_item.item.name}")
    expect(page).to have_content("#{order_item.quantity}")
    expect(page).to have_content("#{order_item.price}")
    expect(page).to have_content("#{order.status}")
  end
end
