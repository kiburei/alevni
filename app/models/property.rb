class Property < ActiveRecord::Base
  has_many :shares, :dependent => :destroy
  has_many :share_buy_requests
  has_many :share_sell_requests

  # scope :sellable -> { where(self.shares.status: false) }

  def self.p_code
    @property = Property.last

    if @property != nil
      @code = @property.Code + 1
    else
      @code = 7001
    end



  end
  # def has_shares
  #   self.shares.where(status: false)
  # end
  #
  # def selling
  #   self.shares.where(share_sell_request_id: nil)
  #
  # end

end
