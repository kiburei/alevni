class RemoveCertCodeFromShares < ActiveRecord::Migration
  def change
    remove_column :shares, :share_cert_code
  end
end
