class Admin::InvoicesController < ApplicationController
  def index
    @invoices = Invoice.all.sorted(params)

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
    @invoice_items = @invoice.sort_invoice_items(params)
  end
end