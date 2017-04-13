class ChangeLnameToGuardian < ActiveRecord::Migration[5.0]
  def self.up
    rename_column :users, :last_name, :guardian
  end
end
