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
end
