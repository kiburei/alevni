class ChangedecimalprecisionPrice < ActiveRecord::Migration[5.0]
  def self.up
    change_table :properties do |t|
      t.change :Price, :decimal, :precision => 11, :scale => 2
    end
  end
  def self.down
    change_table :properties do |t|
      t.change :Price, :deciaml, :precision => 8, :scale => 2
    end
  end
end
