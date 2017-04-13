class AddStatusToShareSellRequest < ActiveRecord::Migration
  def change
    add_column :share_sell_requests, :status, :boolean, default: false
  end
end
