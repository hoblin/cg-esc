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

ActiveRecord::Schema[8.0].define(version: 2025_02_16_225013) do
  create_table "contests", force: :cascade do |t|
    t.integer "year"
    t.integer "host_country_id", null: false
    t.string "host_city"
    t.string "slogan"
    t.datetime "grand_final_date"
    t.datetime "first_semifinal_date"
    t.datetime "second_semifinal_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["host_country_id"], name: "index_contests_on_host_country_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.string "flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "data_migrations", primary_key: "version", id: :string, force: :cascade do |t|
  end

  create_table "entries", force: :cascade do |t|
    t.integer "contest_id", null: false
    t.integer "country_id", null: false
    t.string "artist_name"
    t.string "song_title"
    t.text "lyrics"
    t.text "en_lyrics"
    t.integer "semifinal"
    t.integer "semifinal_order"
    t.integer "final_order"
    t.boolean "qualified"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contest_id"], name: "index_entries_on_contest_id"
    t.index ["country_id"], name: "index_entries_on_country_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "ip_address"
    t.string "user_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "settings"
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  add_foreign_key "contests", "countries", column: "host_country_id"
  add_foreign_key "entries", "contests"
  add_foreign_key "entries", "countries"
  add_foreign_key "sessions", "users"
end
