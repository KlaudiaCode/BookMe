class TradesController < ApplicationController
  before_action :require_user

  def index
    @my_trades = Trade.where(trader_id: current_user.id)
    @received_trades = Trade.where(owner_id: current_user.id)
  end

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
      @item = Item.find(params[:trade][:owner_item_id])
      @my_items = current_user.items
      @trade = Trade.new
      render :new
    end
  end

  def update
    trade = Trade.find(params[:id])
    trade.update(status: params[:status].to_i)
    redirect_to trades_path
  end

  def destroy
    @trade = Trade.find(params[:id])
    if @trade.destroy
      flash[:warning] = 'Oferta została cofnięta.'
    else
      flash[:warning] = 'Podczas rezygnacji wystąpił błąd. Spróbuj ponownie.'
    end
    redirect_to trades_path
  end

  def archive
    trade = Trade.find(params[:trade_id])
    trade.update(archived: true)
    redirect_to trades_path
  end

  private

  def trade_params
    params.require(:trade).permit(:owner_id, :owner_item_id, :trader_item_id)
  end
end
