class FixColumnNamesPropertyidUseridonSharesell < ActiveRecord::Migration
  def change
    change_table :share_sell_requests do |t|
      t.rename :property_id_id, :property_id
      t.rename :user, :user_id
    end
  end
end
