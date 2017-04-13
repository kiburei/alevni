class CreateShares < ActiveRecord::Migration
  def change
    create_table :shares do |t|
      t.string :code
      t.decimal :value
      t.date :period

      t.timestamps null: false

    end
  end
end
