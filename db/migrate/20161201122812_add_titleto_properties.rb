class AddTitletoProperties < ActiveRecord::Migration
  def change
    add_column :properties, :Title, :string
  end
end
