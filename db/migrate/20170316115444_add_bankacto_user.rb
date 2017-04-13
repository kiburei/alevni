class AddBankactoUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :bank_ac, :string

  end
end
