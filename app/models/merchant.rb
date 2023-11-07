class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices, through: :items
  has_many :invoice_items, through: :items
  has_many :transactions, through: :invoices

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

  def self.top_5_by_revenue
    select("merchants.name, merchants.id, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue").joins(items: { invoice_items: { invoice: :transactions } }).where("transactions.result = ?", "0").group("merchants.id").limit(5).order("revenue DESC")
  end

  def top_rev_date
    rev_hash = invoice_items.reduce({}) do |hash, cur_item|
      rev = cur_item.unit_price * cur_item.quantity
      if hash[cur_item.updated_at]
        hash[cur_item.updated_at] += rev
        hash
      else
        hash[cur_item.updated_at] = rev
        hash
      end
    end
    rev_hash.max_by{ |date, revenue| revenue }
  end
end