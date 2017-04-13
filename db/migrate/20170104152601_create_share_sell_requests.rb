class CreateShareSellRequests < ActiveRecord::Migration
  def change
    create_table :share_sell_requests do |t|
      t.references :property_id
      t.integer :user
      t.integer :no_of_shares 

      t.timestamps null: false
    end
  end
end
