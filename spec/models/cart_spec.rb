require "rails_helper"

describe Cart do

  subject { Cart.new({"1" => 1, "2" => 2}) }

  describe "#total_count" do
    it 'should return total count of items in cart' do
      expect(subject.total_count).to eq(3)
    end
  end

  describe "#add_item" do
    it 'should add an item to the cart' do

      subject.add_item("1")
      subject.add_item("2")

      expect(subject.contents).to eq({"1" => 2, "2" => 3})
    end
  end

  describe "#total_price" do
    it 'should give the total price for the cart' do
      item_1 = create(:item)
      item_2 = create(:item)

      expect(subject.total_price).to eq(item_1.price + (item_2.price * 2))
    end
  end

  describe '#find_items' do
    it 'should return array of all items in cart' do
      item_1 = create(:item)
      item_2 = create(:item)
      expect(subject.find_items).to eq([item_1, item_2])
    end
  end
end
