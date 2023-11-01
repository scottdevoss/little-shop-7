class ChangeStatusToBeIntegerInInvoices < ActiveRecord::Migration[7.0]
  def change
    change_column :invoices, :status, :integer, using: 'status::integer'
  end
end
