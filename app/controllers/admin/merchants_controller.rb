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
    if merchant.update({name: params[:name]})
      redirect_to "/admin/merchants/#{merchant.id}"
      flash[:alert] = "The information has been successfully updated."
    end
  end

end