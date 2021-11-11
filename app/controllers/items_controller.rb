class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to @item
    else
      render :new
    end
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      redirect_to items_path
    else
      redirect_to @item, notice: 'Nie udało się usunąć oj'
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :author, :description, :group)
  end
end
