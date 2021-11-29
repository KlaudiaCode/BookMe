class TradesController < ApplicationController

  before_action :require_user

  def new
    @item = Item.find(params[:item_id])
    @my_items = current_user.items
    @trade = Trade.new
  end

  def create
    @trade = Trade.new(trade_params)
    @trade.trader_id = current_user.id
    if @trade.save
      flash[:success] = 'Oferta została wysłana do właściciela.'
      redirect_to items_path
    else 
      flash[:warning] = @trade.errors.full_messages
      render :new
    end
  end

  private

  def trade_params
    params.require(:trade).permit(:owner_id, :owner_item_id, :trader_item_id)
  end

end
