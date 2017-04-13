class AddDefaultValueToStatusOnSharebuyRequest < ActiveRecord::Migration
  def change
    change_column :share_buy_requests, :status, :boolean, :default => false
  end
end
