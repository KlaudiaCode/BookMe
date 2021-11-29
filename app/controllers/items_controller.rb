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
    if logged_in?
      user = current_user
    else
      user = User.first
    end
    @item = Item.new(item_params)
    @item.user = user

    if @item.save
      redirect_to @item
    else
      flash[:warning] = @item.errors.full_messages
      render :new
    end
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      redirect_to items_path
      flash[:success] = 'Przedmiot został usunięty'
    else
      redirect_to @item
      flash[:warning] = 'Nie udało się usunąć oj'
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :author, :description, :group, :publisher, :condition_id, :image)
  end
end
