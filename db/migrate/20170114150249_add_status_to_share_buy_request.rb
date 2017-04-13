class AddStatusToShareBuyRequest < ActiveRecord::Migration
  def change
    add_column :share_buy_requests, :staus, :boolean, default: false
  end
end
