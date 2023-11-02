class RemoveItemIdFromInvoiceItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :invoice_items, :item_id
  end
end
