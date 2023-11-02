class RemoveInvoiceIdFromInvoiceItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :invoice_items, :invoice_id
  end
end
