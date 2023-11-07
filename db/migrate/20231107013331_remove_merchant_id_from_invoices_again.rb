class RemoveMerchantIdFromInvoicesAgain < ActiveRecord::Migration[7.0]
  def change
    remove_column :invoices, :merchant_id, :bigint
  end
end
