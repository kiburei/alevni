class AddEndOffertoProperties < ActiveRecord::Migration
  def change
    add_column :properties, :EndOffer, :date
  end
end
