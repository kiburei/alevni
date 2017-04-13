class AddStartOffertoProperties < ActiveRecord::Migration
  def change
    add_column :properties, :StartOffer, :date
  end
end
