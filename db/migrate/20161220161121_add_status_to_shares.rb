class AddStatusToShares < ActiveRecord::Migration
  def change
    add_column :shares, :status, :boolean, default: false
  end
end
