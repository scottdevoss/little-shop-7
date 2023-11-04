class ItemsController < ApplicationController

  def update
    @item = Item.find(params[:id])
    @item.toggle_status
    redirect_to "/merchants/#{@item.merchant_id}/items"

  end
end