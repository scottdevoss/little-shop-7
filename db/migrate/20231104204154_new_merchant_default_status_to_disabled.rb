class NewMerchantDefaultStatusToDisabled < ActiveRecord::Migration[7.0]
  def change
    change_column_default :merchants, :status, 0
  end
end
