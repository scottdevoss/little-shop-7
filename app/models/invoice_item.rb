class InvoiceItem < ApplicationRecord
  belongs_to :invoice
  belongs_to :item
  
  enum status: {"pending": 0, "packaged": 1, "shipped": 2}

  def merchant
    self.item.merchant.id
  end

  def change_status(new_status)
    self.status = new_status
    self.save
  end

  def self.most_recent
    order(created_at: :desc)
  end

  def discount_rate
    rate = item.merchant.discounts
               .where("discounts.qty <= ?", self.quantity)
               .select("MAX(discounts.discount) AS max_discount")[0]
               .max_discount
    return 0 if rate == nil
    (rate.to_f/100).round(2)
  end
    
end