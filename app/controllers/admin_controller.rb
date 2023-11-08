class AdminController < ApplicationController
  def index
    @topfivecustomers = Customer.top_five
    @invoices = @customers.sort_invoices(params)
  end
end