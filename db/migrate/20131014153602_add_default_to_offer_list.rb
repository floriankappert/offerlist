class AddDefaultToOfferList < ActiveRecord::Migration
  def self.up
  	change_column_default :offer_items, :vatrate, 19
  end

  def self.down
    change_column_default :offer_items, :vatrate, 0
  end
end
