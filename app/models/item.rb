class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  enum :status, {"disabled" => 0, "enabled" => 1}

  def invoice
  self.invoices.each do |invoice|
    invoice
  end
end

  def invoice_date
    self.invoice.first.creation_date
  end

  def packaged
    return unless invoice_items.includes(:invoice_items).where(status: 1).exists?
    self
  end

  def invoice_id
    invoice_items.pluck(:invoice_id)
  end

  def self.old_to_new
    joins(:invoices).order('invoices.created_at')
  end

  def self.item_revenue(item)
    joins(invoice_items: { invoice: :transactions })
    .where(transactions: { result: 'success' })
    .where("invoice_items.item_id = ?", item.id)
    .sum("invoice_items.quantity * invoice_items.unit_price")
  end

  def self.item_best_day(item)
    select("MAX(invoice_items.quantity * invoice_items.unit_price) AS total_revenue, DATE(invoices.created_at) AS date").
    joins(invoice_items: { invoice: :transactions })
    .where("items.id = ?", item.id).group(:date)
    .order("total_revenue DESC").first.date
  end
  
  def button_text
    return "Disable" if status == "enabled"
    "Enable"
  end

  def enabled?
    if self.status == "enabled"
      return true
    end
  end

  def toggle_status
    if self.status == "disabled"
      self.status = "enabled"
    else
      self.status = "disabled"
    end
    self.save
  end

  def self.alphabetical
    order(:name)
  end

  def self.most_recent
    order(created_at: :desc)
  end
end