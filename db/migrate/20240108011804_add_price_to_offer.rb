class AddPriceToOffer < ActiveRecord::Migration[7.1]
  def change
    add_column :offers, :price, :float
  end
end
