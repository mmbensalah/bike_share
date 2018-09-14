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
end
