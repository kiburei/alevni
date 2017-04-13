class AddCertCodeToShares < ActiveRecord::Migration
  def change
    add_column :shares, :cert_code, :string
  end
end
