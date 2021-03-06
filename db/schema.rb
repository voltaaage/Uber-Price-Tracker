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

ActiveRecord::Schema.define(version: 20170822093138) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "destinations", force: :cascade do |t|
    t.float "latitude"
    t.float "longitude"
    t.string "address"
    t.string "city"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "destinations_uber_routes", id: false, force: :cascade do |t|
    t.bigint "destination_id", null: false
    t.bigint "uber_route_id", null: false
  end

  create_table "price_estimates", force: :cascade do |t|
    t.datetime "time_requested"
    t.float "high_estimate"
    t.float "low_estimate"
    t.float "distance"
    t.float "surge_multiplier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "uber_route_id"
    t.index ["uber_route_id"], name: "index_price_estimates_on_uber_route_id"
  end

  create_table "uber_routes", force: :cascade do |t|
    t.string "destination_1_lat"
    t.string "destination_1_long"
    t.string "destination_2_lat"
    t.string "destination_2_long"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_uber_routes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "price_estimates", "uber_routes"
  add_foreign_key "uber_routes", "users"
end
