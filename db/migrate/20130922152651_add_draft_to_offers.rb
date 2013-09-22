class AddDraftToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :draft, :boolean, default: true
  end
end
