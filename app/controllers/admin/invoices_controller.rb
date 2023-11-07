class Admin::InvoicesController < ApplicationController
  def index
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
  end
end