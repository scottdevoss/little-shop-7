class MerchantDiscountsController < ApplicationController 
  def index 
    @discounts = Discount.all
    @merchant = Merchant.find(params[:merchant_id])
  end

  def show 
    @discount = Discount.find(params[:id])
    @merchant = Merchant.find(params[:merchant_id])
  end

  def new 
    @merchant = Merchant.find(params[:merchant_id])
  end

  def create 
    merchant = Merchant.find(params[:merchant_id])

    if params[:new_rate] =~ /\A\d+\Z/  && params[:threshold] =~ /\A\d+\Z/ 
      discount = Discount.new({discount: params[:new_rate], qty: params[:threshold], merchant_id: params[:merchant_id]})
      discount.save
    else
      flash[:notice] = "Discount not added. The discount rate or quantity field was not filled in correctly. Please try again."
    end
      redirect_to "/merchants/#{merchant.id}/discounts"
  end

end