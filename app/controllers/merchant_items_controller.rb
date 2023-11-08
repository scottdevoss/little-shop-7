class MerchantItemsController < ApplicationController
  def index
    @merchant = Merchant.find(params[:merchant_id])
    if params[:sort] == "alphabetical"
      @items = @merchant.items.alphabetical
    elsif params[:sort] == "date"
      @items = @merchant.items.most_recent
    else
      @items = @merchant.items
    end
  end

  def show
    @item = Item.find(params[:id])
    @merchant = @item.merchant
  end

  def new
    @merchant = Merchant.find(params[:merchant_id])
  end

  def create
    # require 'pry'; binding.pry
    @merchant = Merchant.find(params[:merchant_id])
    Item.create!(name: params[:name], description: params[:description], unit_price: params[:unit_price], merchant_id: params[:merchant_id])
    redirect_to "/merchants/#{@merchant.id}/items"
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