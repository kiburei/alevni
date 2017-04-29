class AddNewColumnsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :application_date, :date
    add_column :users, :end_of_subscription, :date
    add_column :users, :address_code, :string
    add_column :users, :town, :string
    add_column :users, :county, :string
    add_column :users, :investment_advisor, :string
  end
end
