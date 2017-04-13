class AddDetailsToUsersNextOfKin < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :nok, :string
    
  end
end
