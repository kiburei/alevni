class AddShareSellRequestIdtoShares < ActiveRecord::Migration
  def change
    add_reference :shares, :share_sell_request, index: true, foreign_key: true
  end
end
