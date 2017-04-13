class FixColumnName < ActiveRecord::Migration
  def self.up
    rename_column :properties, :Name, :County
  end

  def self.down
    # rename back if you need or do something else or do nothing
  end
end
