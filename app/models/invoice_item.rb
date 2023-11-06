class InvoiceItem < ApplicationRecord
  belongs_to :invoice
  belongs_to :item
  
  enum status: {"pending": 0, "packaged": 1, "shipped": 2}


  def merchant
    self.item.merchant.id
  end

  # def name
  #   self.item.name
  # end

  # def status_number
  #   if self.status == 0
  #     "pending"
  #   elsif self.status == 1
  #     "packaged"
  #   else
  #     "shipped"
  #   end
  # end

  def change_status(new_status)
    self.status = new_status
    self.save
  end

end