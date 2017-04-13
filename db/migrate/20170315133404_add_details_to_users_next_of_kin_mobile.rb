class AddDetailsToUsersNextOfKinMobile < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :nok_mobile, :string
  end
end
