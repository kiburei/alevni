class AddReasontoProperties < ActiveRecord::Migration
  def change
    add_column :properties, :Reason, :string
  end
end
