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
end