class AddSellPricetoShareSellRequest < ActiveRecord::Migration
  def change
    add_column :share_sell_requests, :sale_price, :integer

  end
end
