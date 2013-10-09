class CreateOfferItems < ActiveRecord::Migration
  def change
    create_table :offer_items do |t|
      t.references :offer
      t.string :title
      t.string :description
      t.integer :position
      t.decimal :net
      t.decimal :vat
      t.integer :vatrate
      t.decimal :gross

      t.timestamps
    end
    add_index :offer_items, :offer_id
  end
end
