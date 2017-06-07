class CreateNewsAndEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :news_and_events do |t|
      t.string :title
      t.text :post, :limit => nil

      t.timestamps
    end
  end
end
