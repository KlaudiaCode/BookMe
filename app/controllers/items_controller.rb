class ItemsController < ApplicationController
  before_action :require_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_item, only: [:show, :edit, :update, :destroy]

  def index
    if session[:filter] != nil
      @items = Item.search(params[:search], params[:place], session[:filter], current_user).order(params[:sort_type])
    else
      @items = Item.search(params[:search], params[:place], current_user).order(params[:sort_type])
    end
  end

  def new
    @item = Item.new
  end

  def show; end

  def edit; end

  def update
    if @item.update(item_params)
      flash[:success] = 'Dane przedmiotu zostały zaktualizowane'
      redirect_to @item
    else
      render 'edit'
    end
  end

  def create
    @item = Item.new(item_params)
    if ActiveModel::Type::Boolean.new.cast(params[:item][:correct])
      @item.user = current_user

      if @item.save
        create_item_genres params[:item][:genres], @item.id
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
    if @item.destroy
      redirect_to items_path
      flash[:success] = 'Przedmiot został usunięty'
    else
      redirect_to @item
      flash[:warning] = 'Nie udało się usunąć przedmiotu. Spróbuj ponownie'
    end
  end

  def change_filter
    if params[:filter] == "false"
      session[:filter] = session[:filter] == false ? session[:filter] = nil : session[:filter] = false
    else
      session[:filter] = session[:filter] == true ? session[:filter] = nil : session[:filter] = true
    end
    redirect_to root_path
  end

  private

  def find_item
    @item = Item.find(params[:id])
  end

  def create_item_genres(genres, item_id)
    if genres
      genres.each do |genre|
        ItemGenre.create(item_id: item_id, genre_id: genre.to_i)
      end
    end
  end

  def item_params
    params.require(:item).permit(:title, :author, :description, :group, :publisher, :condition_id, :genre_id, :place, :latitude, :longitude, :player_max, :player_min, images: [])
  end
end
