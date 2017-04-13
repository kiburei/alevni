class RemoveShareColumnFromProperty < ActiveRecord::Migration
  def change
    remove_column :properties, :shares_count
  end
end
