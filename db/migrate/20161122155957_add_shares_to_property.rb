class AddSharesToProperty < ActiveRecord::Migration
  def change
    add_column :properties, :Shares, :integer
  end
end
