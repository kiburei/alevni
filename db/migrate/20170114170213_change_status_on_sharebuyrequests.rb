class ChangeStatusOnSharebuyrequests < ActiveRecord::Migration
  def self.up
    rename_column :share_buy_requests, :staus, :status
  end

end
