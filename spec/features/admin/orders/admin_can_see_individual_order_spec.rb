require 'rails_helper'

describe 'admin can visit individual order show page' do
  it 'shows all the details for this item' do
    item_1 = create(:item)
    item_2 = create(:item)
    order = create(:order)
    OrderItem.create(order_id: order.id, item_id: item_1.id, price: 50, quantity: 1, title: "Test")
    OrderItem.create(order_id: order.id, item_id: item_2.id, price: 100, quantity: 2, title: "Test")
    admin = order.user
    order.user.role = 1
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_order_path(order)

    expect(page).to have_content("#{order.user.first_name}")
    expect(page).to have_content("#{order.user.last_name}")
    expect(page).to have_content("#{order.user.address}")

    order.order_items.each do |order_item|
      expect(page).to have_content("#{order_item.item.title}")
      expect(page).to have_content("#{order_item.price}")
      expect(page).to have_content("#{order_item.quantity}")
    end
    expect(page).to have_content("#{order.status.capitalize}")
    expect(page).to have_content("Back to all Orders")
  end
end
