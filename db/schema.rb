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

ActiveRecord::Schema[7.0].define(version: 2023_03_28_012851) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "station_statuses", force: :cascade do |t|
    t.integer "num_ebikes_available"
    t.string "station_status"
    t.integer "is_installed"
    t.integer "num_bikes_disabled"
    t.integer "num_bikes_available"
    t.integer "num_docks_disabled"
    t.integer "is_returning"
    t.integer "is_renting"
    t.boolean "eightd_has_available_keys"
    t.string "legacy_id"
    t.integer "num_docks_available"
    t.integer "last_reported"
    t.string "station_id"
    t.datetime "requested_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
