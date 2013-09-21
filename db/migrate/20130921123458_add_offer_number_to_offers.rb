class AddOfferNumberToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :offer_number, :integer
  end
end
