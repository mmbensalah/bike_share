class Cart
  attr_reader :contents

  def initialize(cart_contents)
    @contents = cart_contents || Hash.new(0)
  end

  def total_count
    @contents.values.sum
  end

  def add_item(item_id)
    if @contents[item_id.to_s]
      @contents[item_id.to_s] += 1
    else
      @contents[item_id.to_s] = 1
    end
  end

  def remove_item(id)
    @contents.delete(id.to_s)
  end

  def total_price
    @contents.inject(0) do |sum, (item_id, quantity)|
      sum += Item.find(item_id).price * quantity
    end
  end

  def find_items
    @contents.map do |item_id, _ |
      Item.find(item_id)
    end
  end
end
