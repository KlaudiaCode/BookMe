class ItemsController < ApplicationController
  
  before_action :require_user, only: [:new, :create, :destroy]

  def index
    if logged_in?
      @items = Item.search(params[:search], current_user.id).order(params[:sort_type])
    else
      @items = Item.search(params[:search]).order(params[:sort_type])
    end
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
      flash[:warning] = 'Musisz się zalogować aby dodawać przedmioty '
      user = User.first
    end
    @item = Item.new(item_params)
    @item.user = user

    if @item.save
      flash[:success] = 'Przedmiot został dodany'
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
    params.require(:item).permit(:title, :author, :description, :group, :publisher, :condition_id, :image, :search)
  end
end
