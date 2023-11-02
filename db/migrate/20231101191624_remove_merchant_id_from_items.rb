class RemoveMerchantIdFromItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :items, :merchant_id
  end
end
