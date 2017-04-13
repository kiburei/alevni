class AddCosttoBuyrequest < ActiveRecord::Migration[5.0]
  def change
    add_column :share_buy_requests, :total, :decimal, precision: 8, scale: 2
  end
end
