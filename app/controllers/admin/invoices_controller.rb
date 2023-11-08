class Admin::InvoicesController < ApplicationController
  def index
    @invoices = Invoice.all.sorted(params)
  end

  def show
    @invoice = Invoice.find(params[:id])
    @invoice_items = @invoice.sort_invoice_items(params)
  end
end