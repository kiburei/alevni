class AddFieldstoUser < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :country, :string
    add_column :users, :mobile_no, :string
    add_column :users, :member_code, :string
  end
end
