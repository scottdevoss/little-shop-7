class Admin::InvoicesController < ApplicationController
  def index
    @invoices = Invoice.all.sorted(params)
    # require 'pry'; binding.pry
    # @invoices.sorted(params)
    # require 'pry'; binding.pry
    # if params[:sort] == "alphabetical"
    #   @invoices = Invoice.alphabetical
    # elsif params[:sort] == "date"
    #   @invoices = Invoice.most_recent
    # else
    #   @invoices = Invoice.all
    # end
  end

  def show
    @invoice = Invoice.find(params[:id])
    if params[:sort] == "date"
      @invoice_items = @invoice.invoice_items.most_recent
    else
      @invoice_items = @invoice.invoice_items
    end
  end
end