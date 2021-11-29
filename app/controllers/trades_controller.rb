class TradesController < ApplicationController

  before_action :require_user

  def new
    @item = Item.find(params[:item_id])
    @my_items = current_user.items
  end

  def create
  end

end
