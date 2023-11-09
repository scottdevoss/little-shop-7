class AdminController < ApplicationController
  def index
    @topfivecustomers = Customer.top_five
    if params[:sort] == "alphabetical"
      @invoices = Invoice.alphabetical
    elsif params[:sort] == "date"
      @invoices = Invoice.most_recent
    else
      @invoices = Invoice.all
    end
    # @invoices = Customer.sort_invoices(params)
  end
end