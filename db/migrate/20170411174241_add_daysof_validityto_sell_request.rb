class AddDaysofValiditytoSellRequest < ActiveRecord::Migration[5.0]
  def change
    add_column :share_sell_requests, :validity_days, :date
  end
end
