class Admin::MerchantsController < ApplicationController
  def index
    @merchants = Merchant.all
  end

  def show
    @merchant = Merchant.find(params[:id])
  end

  def edit
    @merchant = Merchant.find(params[:id])
  end

  def update

    merchant = Merchant.find(params[:id])

    if params[:name]
      if merchant.update({name: params[:name]})
        redirect_to "/admin/merchants/#{merchant.id}"
        flash[:alert] = "The information has been successfully updated."
      end
    end
    
    if params[:status]
      if merchant.update({status: merchant.toggle_status})
        redirect_to "/admin/merchants"
        flash[:alert] = "The status has been #{merchant.status}."
      end
    end
  end

  def new 

  end

  def create 
    merchant = Merchant.new({name: merchant_params[:name]})
    if merchant.save
      redirect_to admin_merchants_path
    else
      flash[:alert] = "There was an error and the merchant was not saved to the system."
    end
  end

  private

  def merchant_params
    params.permit(:name)
  end
  
end