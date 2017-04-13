class AddLRtoProperties < ActiveRecord::Migration
  def change
    add_column :properties, :LR, :string
  end
end
