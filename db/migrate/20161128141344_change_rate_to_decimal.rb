class ChangeRateToDecimal < ActiveRecord::Migration
  def self.up
    change_table :properties do |t|
      t.change :Rate, :decimal, :precision => 8, :scale => 2
    end
  end
  def self.down
    change_table :properties do |t|
      t.change :Rate, :integer
    end
  end
end
