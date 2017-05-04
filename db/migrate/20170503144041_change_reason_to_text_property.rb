class ChangeReasonToTextProperty < ActiveRecord::Migration[5.0]
  def self.up
    change_table :properties do |t|
      t.change :Reason, :text, :limit => nil
    end
  end
  def self.down
    change_table :properties do |t|
      t.change :Reason, :string
    end
  end
end
