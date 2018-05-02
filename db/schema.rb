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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180502082816) do

  create_table "customers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "card_number", default: ""
    t.integer "year", default: 0
    t.integer "month", default: 0
    t.integer "cvv", default: 0
    t.string "confirm_token", default: ""
    t.boolean "email_confirmed", default: false
    t.bigint "person_id"
    t.index ["person_id"], name: "index_customers_on_person_id"
  end

  create_table "people", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.string "password_digest"
    t.string "country", default: ""
    t.string "city", default: ""
    t.string "street", default: ""
    t.string "provider", default: ""
    t.string "uid", default: ""
  end

  add_foreign_key "customers", "people"
end
