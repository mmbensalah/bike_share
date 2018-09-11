class Cart
  attr_reader :contents

  def initialize(cart_contents)
    @contents = cart_contents
  end

  def total_count
    @contents.values.sum
  end

  def add_item(item_id)
    @contents[item_id.to_s] += 1
  end
end
