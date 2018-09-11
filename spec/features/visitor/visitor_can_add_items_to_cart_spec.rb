require "rails_helper"

describe "When a visitor visits /bike-shop" do
  it "they can add items to the cart" do
    item_1 = Item.create(title: "Handlebars", price: "35.00", image: './assets/bike_gear.jpg', description: 'Use to steer your bike.', status: 0)
    item_2 = Item.create(title: "Pedals", price: "12.50", image: './assets/bike_gear.jpg', description: 'Use to make your bike go.', status: 0)

    visit bike_shop_path

    within("#item-#{item_1.id}") do
      click_on("Add to Cart")
    end

    expect(current_path).to eq(bike_shop_path)
    expect(page).to have_content("You have successfully added #{item_1.title} to your cart.")
  end

  it "should keep track of number of items in cart" do
    item_1 = Item.create(title: "Handlebars", price: "35.00", image: './assets/bike_gear.jpg', description: 'Use to steer your bike.', status: 0)
    item_2 = Item.create(title: "Pedals", price: "12.50", image: './assets/bike_gear.jpg', description: 'Use to make your bike go.', status: 0)

    visit bike_shop_path

    within("#item-#{item_1.id}") do
      click_on("Add to Cart")
    end

    expect(page).to have_content("Cart: 1")

    within("#item-#{item_2.id}") do
      click_on("Add to Cart")
    end

    expect(page).to have_content("You have successfully added #{item_2.title} to your cart.")
    expect(page).to have_content("Cart: 2")
  end
end
