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

ActiveRecord::Schema[8.0].define(version: 2025_02_16_034243) do
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

  add_foreign_key "contests", "countries", column: "host_country_id"
end
