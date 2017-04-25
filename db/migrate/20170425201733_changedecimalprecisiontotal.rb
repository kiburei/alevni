class Changedecimalprecisiontotal < ActiveRecord::Migration[5.0]
  def self.up
    change_table :share_buy_requests do |t|
      t.change :total, :decimal, :precision => 11, :scale => 2
    end
  end
  def self.down
    change_table :share_buy_requests do |t|
      t.change :total, :deciaml, :precision => 8, :scale => 2
    end
  end
end
