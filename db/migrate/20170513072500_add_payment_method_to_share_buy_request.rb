class AddPaymentMethodToShareBuyRequest < ActiveRecord::Migration[5.0]
  def change
    add_column :share_buy_requests, :pay_method, :string
  end
end
