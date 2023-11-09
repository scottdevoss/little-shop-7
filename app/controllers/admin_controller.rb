class AdminController < ApplicationController
  def index
    @topfivecustomers = Customer.top_five
    @invoices = Customer.sort_invoices(params)
  end
end