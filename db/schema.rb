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

ActiveRecord::Schema.define(version: 20180508124732) do

  create_table "airlines", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.bigint "user_account_id"
    t.index ["user_account_id"], name: "index_airlines_on_user_account_id", unique: true
  end

  create_table "airplanes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.integer "seats"
  end

  create_table "airports", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "IATA"
    t.bigint "city_id"
    t.index ["city_id"], name: "index_airports_on_city_id"
  end

  create_table "baggages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.float "price", limit: 24
  end

  create_table "cities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.bigint "country_id"
    t.index ["country_id"], name: "index_cities_on_country_id"
  end

  create_table "countries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "alpha2"
  end

  create_table "customers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "card_number"
    t.integer "year"
    t.integer "month"
    t.integer "cvv"
    t.string "confirm_token", default: ""
    t.boolean "email_confirmed", default: false
    t.bigint "person_id"
    t.index ["person_id"], name: "index_customers_on_person_id", unique: true
  end

  create_table "discount_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.float "value", limit: 24
  end

  create_table "flight_statuses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
  end

  create_table "flight_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
  end

  create_table "flights", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "flight_identifier"
    t.float "ticket_price", limit: 24
    t.datetime "dep_date"
    t.datetime "arr_date"
    t.bigint "airline_id"
    t.bigint "airplane_id"
    t.bigint "airport_id"
    t.bigint "flight_type_id"
    t.bigint "flight_status_id"
    t.index ["airline_id"], name: "index_flights_on_airline_id"
    t.index ["airplane_id"], name: "index_flights_on_airplane_id"
    t.index ["airport_id"], name: "index_flights_on_airport_id"
    t.index ["flight_status_id"], name: "index_flights_on_flight_status_id"
    t.index ["flight_type_id"], name: "index_flights_on_flight_type_id"
  end

  create_table "news", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.text "content"
    t.date "add_date"
    t.string "image"
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
    t.boolean "without_password", default: false
  end

  create_table "tickets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "first_name"
    t.string "last_name"
    t.float "price", limit: 24
    t.bigint "customers_id"
    t.bigint "discount_type_id"
    t.bigint "flight_id"
    t.bigint "baggages_id"
    t.index ["baggages_id"], name: "index_tickets_on_baggages_id"
    t.index ["customers_id"], name: "index_tickets_on_customers_id"
    t.index ["discount_type_id"], name: "index_tickets_on_discount_type_id"
    t.index ["flight_id"], name: "index_tickets_on_flight_id"
  end

  create_table "user_accounts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_type_id"
    t.bigint "person_id"
    t.index ["person_id"], name: "index_user_accounts_on_person_id", unique: true
    t.index ["user_type_id"], name: "index_user_accounts_on_user_type_id"
  end

  create_table "user_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
  end

  add_foreign_key "airlines", "user_accounts"
  add_foreign_key "airports", "cities"
  add_foreign_key "cities", "countries"
  add_foreign_key "customers", "people"
  add_foreign_key "flights", "airlines"
  add_foreign_key "flights", "airplanes"
  add_foreign_key "flights", "airports"
  add_foreign_key "flights", "flight_statuses"
  add_foreign_key "flights", "flight_types"
  add_foreign_key "tickets", "baggages", column: "baggages_id"
  add_foreign_key "tickets", "customers", column: "customers_id"
  add_foreign_key "tickets", "discount_types"
  add_foreign_key "tickets", "flights"
  add_foreign_key "user_accounts", "people"
  add_foreign_key "user_accounts", "user_types"
end
