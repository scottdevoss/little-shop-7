class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices, through: :items

  def top_5_customers
    Customer.select('customers.*, COUNT(transactions.id) as success_transactions').joins(invoices: :transactions).where(transactions: { result: "success" }).group('customers.id').order('success_transactions DESC').limit(5)
  end
end