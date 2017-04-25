class ChangedecimalprecisionCurrentPrice < ActiveRecord::Migration[5.0]
  def self.up
    change_table :properties do |t|
      t.change :CurrentPrice, :decimal, :precision => 11, :scale => 2
    end
  end
  def self.down
    change_table :properties do |t|
      t.change :CurrentPrice, :deciaml, :precision => 8, :scale => 2
    end
  end
end
