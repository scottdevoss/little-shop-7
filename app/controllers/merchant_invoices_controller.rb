class MerchantInvoicesController < ApplicationController
  def index
    @merchant = Merchant.find(params[:merchant_id])
  end

  def show
    @invoice = Invoice.find(params[:id])
    @merchant = Merchant.find(params[:merchant_id])
  end

  def update
    merchant = Merchant.find(params[:merchant_id])
    invoiceitem = InvoiceItem.find(params[:id])
    status_key = "status_#{params[:id]}"
    new_status = params[status_key]
    invoiceitem.change_status(new_status)
    redirect_to "/merchants/#{merchant.id}/invoices/#{invoiceitem.invoice.id}"
  end
end