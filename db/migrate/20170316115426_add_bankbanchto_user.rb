class AddBankbanchtoUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :bank_branch, :string

  end
end
