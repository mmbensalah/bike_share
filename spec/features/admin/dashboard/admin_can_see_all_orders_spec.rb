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

      @admin = create(:user, role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
      visit admin_dashboard_path
    end
    it 'should show all orders' do
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

      click_on("Order #{@order_5.id}")
      expect(current_path).to eq(admin_order_path(@order_5))
    end

    it 'should show total of each order status' do
      expect(page).to have_content("Ordered: #{Order.status_total["ordered"]}")
      expect(page).to have_content("Paid: #{Order.status_total["paid"]}")
      expect(page).to have_content("Completed: #{Order.status_total["completed"]}")
      expect(page).to have_content("Cancelled: #{Order.status_total["cancelled"]}")
    end

    it 'should show orders depending on the filter chosen' do
      within("#status-filter") do
        click_on("Cancelled")
      end
      within('.orders') do
        expect(page).to_not have_content("Order #{@order_1.id}")
        expect(page).to_not have_content("Order #{@order_3.id}")
        expect(page).to_not have_content("Order #{@order_6.id}")
      end
      within("#status-filter") do
        click_on("Paid")
      end
      within('.orders') do
        expect(page).to_not have_content("Order #{@order_2.id}")
        expect(page).to_not have_content("Order #{@order_3.id}")
        expect(page).to_not have_content("Order #{@order_6.id}")
      end
      within("#status-filter") do
        click_on("Ordered")
      end
      within('.orders') do
        expect(page).to_not have_content("Order #{@order_1.id}")
        expect(page).to_not have_content("Order #{@order_2.id}")
        expect(page).to_not have_content("Order #{@order_6.id}")
      end
      within("#status-filter") do
        click_on("Completed")
      end
      within('.orders') do
        expect(page).to_not have_content("Order #{@order_1.id}")
        expect(page).to_not have_content("Order #{@order_3.id}")
        expect(page).to_not have_content("Order #{@order_5.id}")
      end
      within("#status-filter") do
        click_on("No Filter")
      end
      within('.orders') do
        expect(page).to have_content("Paid")
        expect(page).to have_content("Ordered")
        expect(page).to have_content("Cancelled")
        expect(page).to have_content("Completed")
      end
    end

    it 'should change paid/ordered status' do
      within("#order-#{@order_1.id}") do
        click_on("Cancel")
      end
      within("#order-#{@order_1.id}") do
        expect(page).to_not have_content("Paid")
        expect(page).to have_content("Cancelled")
      end
      within("#order-#{@order_3.id}") do
        click_on("Cancel")
      end
      within("#order-#{@order_3.id}") do
        expect(page).to_not have_content("Ordered")
        expect(page).to have_content("Cancelled")
      end
    end
  end
end
