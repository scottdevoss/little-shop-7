class MerchantDiscountsController < ApplicationController 
  def index 
    @merchant = Merchant.find(params[:merchant_id])
    @discounts = @merchant.discounts
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
    discount = Discount.new({discount: params[:new_rate], qty: params[:threshold], merchant_id: params[:merchant_id]})

    if discount.save 
      flash[:notice] = "New discount successfully added."
    else 
      flash[:notice] = "Discount not added. Rate or quantity has invalid data. Please try again."
    end
    redirect_to "/merchants/#{merchant.id}/discounts"
  end

  def destroy 
    discount = Discount.find(params[:id])
    merchant = discount.merchant
    discount.destroy

    redirect_to "/merchants/#{merchant.id}/discounts"
  end

  def edit 
    @merchant = Merchant.find(params[:merchant_id])
    @discount = Discount.find(params[:id])
  end

  def update 
    discount = Discount.find([params[:id]]).first
    merchant = Merchant.find([params[:merchant_id]]).first

    if discount.update({ discount: params[:new_rate], qty: params[:threshold], merchant_id: params[:merchant_id] })
      flash[:notice] = "Discount successfully updated."
  else
    flash[:notice] = "Discount not updated. Rate or quantity has invalid data. Please try again."
  end
    redirect_to "/merchants/#{params[:merchant_id]}/discounts/#{params[:id]}"
  end

end