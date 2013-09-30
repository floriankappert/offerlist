class AddDataDeletedtoOffers < ActiveRecord::Migration
  def change
    add_column :offers, :data_deleted, :boolean, default: false
  end
end
