class Admin::ItemsController < Admin::BaseController
  def index
    @items = Item.all 
  end

  def new
    @item = Item.new()
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      flash[:success] = "Item #{@item.title} has been successfully created!"
      redirect_to item_path(@item)
    else
      flash[:failure] = "Your item was not saved. Please try again."
      render :new
    end
  end
  private
    def item_params
      params.require(:item).permit(:title, :price, :description, :image)
    end
end
