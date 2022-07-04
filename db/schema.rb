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

ActiveRecord::Schema[7.0].define(version: 2022_07_04_134051) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "flow_entries", force: :cascade do |t|
    t.string "what"
    t.string "feeling"
    t.string "flow"
    t.bigint "user_id", null: false
    t.string "activity_name"
    t.string "activity_category"
    t.integer "challenge_level"
    t.integer "skill_level"
    t.integer "feeling_competent"
    t.integer "mentally_absorbed"
    t.integer "clear_objectives"
    t.integer "control_situation"
    t.integer "free_from_ego"
    t.integer "free_from_time"
    t.integer "clear_conditions"
    t.integer "great_experience"
    t.boolean "is_voluntary"
    t.integer "happiness_level"
    t.integer "social_quality"
    t.integer "energy_level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_flow_entries_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.boolean "flow_testing"
    t.string "flow_test_intervals"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "private_id"
  end

  add_foreign_key "flow_entries", "users"
end
