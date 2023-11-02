class MerchantItemsController < ApplicationController
  def index
    @merchant = Merchant.find(params[:id])
    @items = @merchant.items
  end

  def show
    @item = Item.find(params[:item_id])
    @merchant = @item.merchant
  end

  def edit
    @item = Item.find(params[:id])
    @merchant = @item.merchant
  end

  def update
    @item = Item.find(params[:id])
    @merchant = @item.merchant
    @item.update(item_params)
    redirect_to "/merchants/#{@merchant.id}/items/#{@item.id}"
    flash.alert = "Item successfully updated"
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :unit_price)
  end
end