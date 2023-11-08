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

end