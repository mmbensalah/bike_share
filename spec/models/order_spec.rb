require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'Relationships' do
    it { should belong_to(:user) }
  end

  describe 'status' do
    it 'is created with status of ordered' do
      order = create(:order)

      expect(order.status).to eq("ordered")
      expect(order.ordered?).to be_truthy
    end

    it 'can have a status of cancelled' do
      order = create(:order, status: 0)

      expect(order.status).to eq("cancelled")
      expect(order.cancelled?).to be_truthy
    end

    it 'can have a status of paid' do
      order = create(:order, status: 2)

      expect(order.status).to eq("paid")
      expect(order.paid?).to be_truthy
    end

    it 'can have a status of completed' do
      order = create(:order, status: 3)

      expect(order.status).to eq("completed")
      expect(order.completed?).to be_truthy
    end
  end

  describe 'class methods' do
    before(:each) do
      @order_1 = create(:order, status: 2)
      @order_2 = create(:order, status: 0)
      @order_3 = create(:order, status: 1)
      @order_4 = create(:order, status: 1)
      @order_5 = create(:order, status: 2)
      @order_6 = create(:order, status: 3)
    end
    context '#status_total' do
      it 'should return total count of orders for each status' do
        expect(Order.status_total).to eq({"cancelled" => 1,
                                          "completed" => 1, 
                                          "ordered" => 2,
                                          "paid"=> 2})
      end
    end
  end
end
