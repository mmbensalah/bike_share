require "rails_helper"

describe "As an admin" do
  describe "when I visit the admin dashboard" do
    before(:each) do
      @item_1 = create(:item)
      @item_2 = create(:item)
      @item_3 = create(:item)
      @item_4 = create(:item)
      @item_5 = create(:item)
      @item_6 = create(:item)
      @item_7 = create(:item)
      @item_8 = create(:item)
      @item_9 = create(:item)

      @order_1 = create(:order, status: 2)
      @order_2 = create(:order, status: 0)
      @order_3 = create(:order, status: 1)
      @order_4 = create(:order, status: 1)
      @order_5 = create(:order, status: 2)
      @order_6 = create(:order, status: 3)

      OrderItem.create(order_id: @order_1, item_id: @item_1, price: @item_1.price, quantity: 1)
      OrderItem.create(order_id: @order_1, item_id: @item_2, price: @item_2.price, quantity: 2)
      OrderItem.create(order_id: @order_2, item_id: @item_3, price: @item_3.price, quantity: 1)
      OrderItem.create(order_id: @order_2, item_id: @item_4, price: @item_4.price, quantity: 3)
      OrderItem.create(order_id: @order_2, item_id: @item_1, price: @item_1.price, quantity: 1)
      OrderItem.create(order_id: @order_3, item_id: @item_7, price: @item_7.price, quantity: 2)
      OrderItem.create(order_id: @order_3, item_id: @item_2, price: @item_2.price, quantity: 1)
      OrderItem.create(order_id: @order_4, item_id: @item_6, price: @item_6.price, quantity: 4)
      OrderItem.create(order_id: @order_4, item_id: @item_5, price: @item_5.price, quantity: 1)
      OrderItem.create(order_id: @order_5, item_id: @item_1, price: @item_1.price, quantity: 9)
      OrderItem.create(order_id: @order_5, item_id: @item_8, price: @item_8.price, quantity: 1)
      OrderItem.create(order_id: @order_6, item_id: @item_1, price: @item_1.price, quantity: 1)
      OrderItem.create(order_id: @order_6, item_id: @item_9, price: @item_9.price, quantity: 2)
      OrderItem.create(order_id: @order_6, item_id: @item_6, price: @item_6.price, quantity: 2)
      OrderItem.create(order_id: @order_6, item_id: @item_4, price: @item_4.price, quantity: 1)
      @admin = create(:user, role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

    end
    it 'should show all orders' do
      visit admin_dashboard_path

      within("#order-#{@order_1.id}") do
        expect(page).to have_content("Order #{@order_1.id}")
      end
      within("#order-#{@order_2.id}") do
        expect(page).to have_content("Order #{@order_2.id}")
      end
      within("#order-#{@order_4.id}") do
        expect(page).to have_content("Order #{@order_4.id}")
      end
      within("#order-#{@order_6.id}") do
        expect(page).to have_content("Order #{@order_6.id}")
      end 
    end
  end
end
