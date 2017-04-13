class AddDetailsToUsersAdvisorCode < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :advisor_code, :string
    
  end
end
