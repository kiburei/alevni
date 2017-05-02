class AddDetailsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :subscription_date, :date
    add_column :users, :end_subscription, :date
    add_column :users, :address_code, :string
    add_column :users, :town, :string
    add_column :users, :county, :string
  end
end
