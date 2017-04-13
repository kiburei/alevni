class Share < ActiveRecord::Base
  belongs_to :property
  belongs_to :user

def self.generate_shares
  @property = Property.last
  @share = 0
  until @share >= @property.Shares do
    @share += 1
    @shares = Share.new(
    :code => @property.Code,
    :value => @property.ShareValue,
    :period => @prfer,
    :property_id => @property.id
    )
    @shares.save
  end

end

def cert_code
  @property = Property.last
  @property.shares.update_all(cert_code: @property.Code)

end

end
