class CreateShareBuyRequests < ActiveRecord::Migration
  def change
    create_table :share_buy_requests do |t|
      t.references :property
      t.integer :user_id
      t.integer :no_of_shares

      t.timestamps null: false
    end
  end
end
