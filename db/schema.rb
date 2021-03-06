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

ActiveRecord::Schema.define(version: 2018_11_15_184341) do

  create_table "boros", force: :cascade do |t|
    t.string "name"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "location_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.boolean "wifi_status"
    t.string "nta_name"
    t.string "address"
    t.integer "boro_id"
    t.integer "zip_id"
    t.integer "census_tract", default: 0
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "faves"
  end

  create_table "zips", force: :cascade do |t|
    t.string "name"
  end

end
