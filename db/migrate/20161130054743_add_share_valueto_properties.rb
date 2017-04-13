class AddShareValuetoProperties < ActiveRecord::Migration
  def change
    add_column :properties, :ShareValue, :decimal, :precision => 8, :scale => 2
  end
end
