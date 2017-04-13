class AddPayamentToBuyRequest < ActiveRecord::Migration[5.0]
  def change
    add_column :share_buy_requests, :transaction_id, :string
  end
end
