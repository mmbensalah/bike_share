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
end
