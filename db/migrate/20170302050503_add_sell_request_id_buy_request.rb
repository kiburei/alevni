class AddSellRequestIdBuyRequest < ActiveRecord::Migration[5.0]
  def change
    add_reference :share_buy_requests, :share_sell_request, index: true, foreign_key: true
  end
end
