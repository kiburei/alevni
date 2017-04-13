class AddAreatoProperty < ActiveRecord::Migration[5.0]
  def change
    add_column :properties, :Area_of_land, :string
  end
end
