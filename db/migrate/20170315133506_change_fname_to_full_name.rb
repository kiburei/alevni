class ChangeFnameToFullName < ActiveRecord::Migration[5.0]
  def self.up
    rename_column :users, :first_name, :full_name
  end
end
