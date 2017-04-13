class AddShareCertCodeToShares < ActiveRecord::Migration
  def change
    add_column :shares, :share_cert_code, :string
  end
end
