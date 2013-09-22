class AddTitleToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :title, :string
    add_column :offers, :project_name, :string
    add_column :offers, :offer_date, :string
    add_column :offers, :offer_due_date, :string
    add_column :offers, :text, :string
  end
end
