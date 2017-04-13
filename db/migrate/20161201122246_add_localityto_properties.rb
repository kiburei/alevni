class AddLocalitytoProperties < ActiveRecord::Migration
  def change
    add_column :properties, :locality, :string
  end
end
