class AddShareBuyRequestIdtoSHares < ActiveRecord::Migration
  def change
    add_reference :shares, :share_buy_request, index: true, foreign_key: true
  end
end
