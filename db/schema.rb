# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_11_19_023451) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "casinos", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.decimal "latitude", precision: 10, scale: 6
    t.decimal "longitude", precision: 10, scale: 6
    t.boolean "active"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "postcode"
    t.string "country"
    t.string "street_number"
  end

  create_table "currencies", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "games", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "trip_id"
    t.date "date"
    t.integer "buy_in"
    t.integer "cash_out"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "casino_id", null: false
    t.bigint "odds_id", null: false
    t.bigint "currency_id", null: false
    t.index ["casino_id"], name: "index_games_on_casino_id"
    t.index ["currency_id"], name: "index_games_on_currency_id"
    t.index ["odds_id"], name: "index_games_on_odds_id"
    t.index ["trip_id"], name: "index_games_on_trip_id"
    t.index ["user_id"], name: "index_games_on_user_id"
  end

  create_table "odds", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "trips", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "image"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "games", "casinos"
  add_foreign_key "games", "currencies"
  add_foreign_key "games", "odds", column: "odds_id"
  add_foreign_key "games", "trips"
  add_foreign_key "games", "users"
end
