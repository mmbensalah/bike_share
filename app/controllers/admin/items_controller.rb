class Admin::ItemsController < Admin::BaseController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new()
  end

  def create
    @item = Item.create(item_params)
    if @item.image == ""
      @item.image = "trail_bike.jpg"
    end
    if @item.save
      flash[:success] = "Item #{@item.title} has been successfully created!"
      redirect_to item_path(@item)
    else
      flash[:failure] = "Your item was not saved. Please try again."
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:success] = "#{@item.title} has been updated."
      redirect_to item_path(@item)
    else
      flash[:failure] = 'Could not update item. Please try again.'
      render :edit
    end
  end

  private
    def item_params
      params.require(:item).permit(:title, :price, :description, :image)
    end
end
