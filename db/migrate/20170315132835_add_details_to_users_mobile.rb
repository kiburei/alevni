class AddDetailsToUsersMobile < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :advisor, :string
    
  end
end
