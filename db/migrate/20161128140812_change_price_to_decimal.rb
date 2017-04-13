class ChangePriceToDecimal < ActiveRecord::Migration
  def self.up
    change_table :properties do |t|
      t.change :Price, :decimal, :precision => 8, :scale => 2
    end
  end
  def self.down
    change_table :properties do |t|
      t.change :Price, :integer
    end
  end
end
