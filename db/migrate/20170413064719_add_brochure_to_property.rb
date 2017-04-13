class AddBrochureToProperty < ActiveRecord::Migration[5.0]
  def change
    add_column :properties, :brochure, :string

  end
end
