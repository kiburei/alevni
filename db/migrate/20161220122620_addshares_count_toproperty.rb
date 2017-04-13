class AddsharesCountToproperty < ActiveRecord::Migration
  def change
    add_column :properties, :shares_count, :integer
  end
end
