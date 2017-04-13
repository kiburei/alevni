class ShareBuyRequest < ActiveRecord::Base
  belongs_to :property
  belongs_to :user
  has_many :shares
  belongs_to :share_sell_request



end
