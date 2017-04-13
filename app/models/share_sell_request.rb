class ShareSellRequest < ActiveRecord::Base
  belongs_to :property
  belongs_to :user
  has_many :shares
  has_many :share_buy_requests

end
