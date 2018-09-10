class ItemsController < ApplicationController
  def index
    @items = Item.where(status: 0)
  end
end
