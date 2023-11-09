class Customer < ApplicationRecord
  has_many :invoices

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  # def self.sort_invoices(params)
  #   if params[:sort] == "alphabetical"
  #     @invoices = Invoice.alphabetical
  #   elsif params[:sort] == "date"
  #     @invoices = Invoice.most_recent
  #   else
  #     @invoices = Invoice.all
  #   end
  # end

  def self.top_five
    Customer.select('customers.*, COUNT(transactions.id) as success_transactions')
    .joins(invoices: :transactions)
    .where(transactions: { result: "success" })
    .group('customers.id')
    .order('success_transactions DESC')
    .limit(5)
  end
end