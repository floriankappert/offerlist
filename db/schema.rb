# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131014153602) do

  create_table "offer_items", :force => true do |t|
    t.integer  "offer_id"
    t.string   "title"
    t.string   "description"
    t.integer  "position"
    t.decimal  "net"
    t.decimal  "vat"
    t.integer  "vatrate",     :default => 19
    t.decimal  "gross"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  add_index "offer_items", ["offer_id"], :name => "index_offer_items_on_offer_id"

  create_table "offers", :force => true do |t|
    t.string   "company"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.integer  "offer_number"
    t.string   "title"
    t.string   "project_name"
    t.string   "offer_date"
    t.string   "offer_due_date"
    t.string   "text"
    t.boolean  "draft",          :default => true
    t.boolean  "data_deleted",   :default => false
  end

end
