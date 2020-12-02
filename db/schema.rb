# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_01_145652) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.string "title"
    t.string "description"
    t.string "country"
    t.integer "price_range"
    t.string "activity"
    t.string "wheather"
    t.string "environment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "favorite_cities", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "city_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["city_id"], name: "index_favorite_cities_on_city_id"
    t.index ["user_id"], name: "index_favorite_cities_on_user_id"
  end

  create_table "favorite_pois", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "poi_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["poi_id"], name: "index_favorite_pois_on_poi_id"
    t.index ["user_id"], name: "index_favorite_pois_on_user_id"
  end

  create_table "pois", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.string "title"
    t.string "description"
    t.string "address"
    t.integer "price_range"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "city_id", null: false
    t.index ["city_id"], name: "index_pois_on_city_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "title"
    t.integer "rating"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "poi_id", null: false
    t.index ["poi_id"], name: "index_reviews_on_poi_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "nickname"
    t.string "firstname"
    t.string "lastname"
    t.string "address"
    t.date "birthdate"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "favorite_cities", "cities"
  add_foreign_key "favorite_cities", "users"
  add_foreign_key "favorite_pois", "pois"
  add_foreign_key "favorite_pois", "users"
  add_foreign_key "pois", "cities"
  add_foreign_key "reviews", "pois"
end
