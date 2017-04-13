class AddCurrentPriceToProperty < ActiveRecord::Migration
  def change
    add_column :properties, :CurrentPrice, :integer
  end
end
