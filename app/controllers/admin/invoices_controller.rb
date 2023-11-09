class Admin::InvoicesController < ApplicationController
  def index
    @invoices = Invoice.all
    if params[:sort] == "alphabetical"
      @invoices = Invoice.alphabetical
    elsif params[:sort] == "date"
      @invoices = Invoice.most_recent
    else
      @invoices = Invoice.all
    end
  end

  def show
    @invoice = Invoice.find(params[:id])
    if params[:sort] == "date"
      @invoice_items = @invoice.invoice_items.most_recent
    else
      @invoice_items = @invoice.invoice_items
    end
    # @invoice_items = @invoice.sort_invoice_items(params)
  end

  def update
    invoice = Invoice.find(params[:id])
    status_key = "status_#{params['id']}"
    new_status = params[status_key]
    invoice.change_status(new_status)
    redirect_to "/admin/invoices/#{invoice.id}"
  end
end