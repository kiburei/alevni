class AddPropertyToShares < ActiveRecord::Migration
  def change
    add_reference :shares, :property, index: true, foreign_key: true
  end
end
