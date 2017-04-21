class User < ActiveRecord::Base

  has_many :shares, :dependent => :destroy
  has_many :properties, :dependent => :destroy
  has_many :share_buy_requests
  has_many :share_sell_requests

  validates :member_code, :presence => true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
 validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

 

end
