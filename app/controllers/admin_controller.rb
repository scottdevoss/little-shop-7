class AdminController < ApplicationController
  def index
    @customers = Customer.all
    if params[:sort] == "alphabetical"
      @invoices = Invoice.alphabetical
    elsif params[:sort] == "date"
      @invoices = Invoice.most_recent
    else
      @invoices = Invoice.all
    end
  end
end