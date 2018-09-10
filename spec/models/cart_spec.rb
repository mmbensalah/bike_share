require "rails_helper"

describe Cart do

  subject { Cart.new({"1" => 1, "2" => 2}) }

  describe "#total_count" do
    it 'should return total count of items in cart' do
      expect(subject.total_count).to eq(5)
    end
  end
end
