class MerchantsController < ApplicationController
  def show
    @merchant = Merchant.find(params[:id])
    @items = @merchant.items.old_to_new
    @topfivecustomers = @merchant.top_5_customers
  end
end