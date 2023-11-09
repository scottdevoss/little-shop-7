class Admin::InvoicesController < ApplicationController
  def index
    @invoices = Invoice.all.sorted(params)
  end

  def show
    @invoice = Invoice.find(params[:id])
    @invoice_items = @invoice.sort_invoice_items(params)
  end

  def update
    invoice = Invoice.find(params[:id])
    status_key = "status_#{params['id']}"
    new_status = params[status_key]
    invoice.change_status(new_status)
    redirect_to "/admin/invoices/#{invoice.id}"
  end
end