class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.string :company

      t.timestamps
    end
  end
end
