class RemoveCustomerIdFromInvoices < ActiveRecord::Migration[7.0]
  def change
    remove_column :invoices, :customer_id
  end
end
