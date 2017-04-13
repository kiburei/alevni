class AddBanktoUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :bank, :string
  end
end
