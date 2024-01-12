class AddNumberOfGuestsToOffer < ActiveRecord::Migration[7.1]
  def change
    add_column :offers, :number_of_guests, :integer
  end
end
