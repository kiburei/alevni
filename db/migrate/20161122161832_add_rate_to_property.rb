class AddRateToProperty < ActiveRecord::Migration
  def change
    add_column :properties, :Rate, :integer
  end
end
