class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices, through: :items

  enum status: { "disabled": 0, "enabled": 1 }

  def top_5_customers
    Customer.select('customers.*, COUNT(transactions.id) as success_transactions').joins(invoices: :transactions).where(transactions: { result: "success" }).group('customers.id').order('success_transactions DESC').limit(5)
  end

  def top_5_items
    Item.select("items.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue").joins(invoice_items: { invoice: :transactions }).where(transactions: { result: "success" }).group("items.id").order("revenue DESC").limit(5)
  end

  def button_text
    return "Disable" if status == "enabled"
    "Enable"
  end

  def enabled?
    return true if status == "enabled"
    false
  end

  def toggle_status
    return 0 if enabled?
    1
  end

  def self.sort_by_name 
    order(:name)
  end

end