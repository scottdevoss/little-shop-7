class MerchantsController < ApplicationController
  def show
    @merchant = Merchant.find(params[:id])
    # @items = @merchant.items.old_to_new
    @items = @merchant.items.order(created_at: :desc)
  end
end