class FixUserOnShareSell < ActiveRecord::Migration
  def change
    def self.up
    rename_column :share_sell_requests, :user, :user_id
  end

  def self.down
    # rename back if you need or do something else or do nothing
  end
  end
end
