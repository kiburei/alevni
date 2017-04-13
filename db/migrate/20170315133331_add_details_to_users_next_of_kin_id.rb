class AddDetailsToUsersNextOfKinId < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :nok_id, :string
    
  end
end
