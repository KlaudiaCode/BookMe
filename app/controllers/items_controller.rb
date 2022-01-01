class ItemsController < ApplicationController
  before_action :require_user, only: [:new, :create, :destroy]

  def index
    if logged_in?
      @items = Item.search(params[:search], params[:place], current_user.id).order(params[:sort_type])
    else
      @items = Item.search(params[:search], params[:place]).order(params[:sort_type])
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @user = current_user
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if ActiveModel::Type::Boolean.new.cast(params[:item][:correct])
      @item.user = current_user
  
      if @item.save
        flash[:success] = 'Przedmiot został dodany'
        redirect_to @item
      else
        flash[:warning] = @item.errors.full_messages
        render :new
      end
    else
      flash[:warning] = 'Wybierz poprawną lokalizację'
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
    params.require(:item).permit(:title, :author, :description, :group, :publisher, :condition_id, :genre_id, :place, :latitude, :longitude, :player_max, :player_min, images: [])
  end
end
