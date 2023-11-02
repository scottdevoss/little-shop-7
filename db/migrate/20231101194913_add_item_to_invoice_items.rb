class AddItemToInvoiceItems < ActiveRecord::Migration[7.0]
  def change
    add_reference :invoice_items, :item, null: false, foreign_key: true
  end
end
