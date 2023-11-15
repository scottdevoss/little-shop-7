class MerchantDiscountsController < ApplicationController 
  def index 
    @discounts = Discount.all
  end

  def show 
    @discount = Discount.find(params[:id])
    @merchant = Merchant.find(params[:merchant_id])
  end
end