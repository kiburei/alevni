class RemoveColumnsUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :application_date
    remove_column :users, :end_of_subscription
    remove_column :users, :address_code
    remove_column :users, :town
    remove_column :users, :county
    remove_column :users, :investment_advisor
    remove_column :users, :subscription_date
  end
end
