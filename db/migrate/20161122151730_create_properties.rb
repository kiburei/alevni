class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.integer :Code
      t.string :Name
      t.integer :Price

      t.timestamps null: false
    end
  end
end
