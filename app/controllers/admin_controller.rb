class AdminController < ApplicationController
  def index
    @customers = Customer.all
    @invoices = @customers.sort_invoices(params)
  end
end