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

ActiveRecord::Schema[8.0].define(version: 2026_06_06_190857) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "bible_verses", force: :cascade do |t|
    t.bigint "bible_version_id", null: false
    t.string "book_code"
    t.integer "chapter"
    t.integer "verse"
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bible_version_id"], name: "index_bible_verses_on_bible_version_id"
  end

  create_table "bible_versions", force: :cascade do |t|
    t.string "name"
    t.string "language"
    t.string "abbreviation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notices", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.string "audience"
    t.bigint "group_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_notices_on_group_id"
    t.index ["user_id"], name: "index_notices_on_user_id"
  end

  create_table "prayer_requests", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.bigint "group_id", null: false
    t.bigint "user_id", null: false
    t.bigint "written_for_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_prayer_requests_on_group_id"
    t.index ["user_id"], name: "index_prayer_requests_on_user_id"
    t.index ["written_for_id"], name: "index_prayer_requests_on_written_for_id"
  end

  create_table "reading_plan_days", force: :cascade do |t|
    t.bigint "reading_plan_id", null: false
    t.integer "day_number"
    t.string "reference_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reading_plan_id"], name: "index_reading_plan_days_on_reading_plan_id"
  end

  create_table "reading_plans", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "plan_type"
    t.integer "total_days"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reading_progresses", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "bible_version_id", null: false
    t.string "book"
    t.integer "chapter"
    t.integer "verse"
    t.datetime "read_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bible_version_id"], name: "index_reading_progresses_on_bible_version_id"
    t.index ["user_id"], name: "index_reading_progresses_on_user_id"
  end

  create_table "task_assignments", force: :cascade do |t|
    t.bigint "task_id", null: false
    t.bigint "user_id", null: false
    t.bigint "group_id", null: false
    t.datetime "completed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_task_assignments_on_group_id"
    t.index ["task_id"], name: "index_task_assignments_on_task_id"
    t.index ["user_id"], name: "index_task_assignments_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "task_type"
    t.string "scope"
    t.bigint "group_id", null: false
    t.bigint "created_by_id", null: false
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by_id"], name: "index_tasks_on_created_by_id"
    t.index ["group_id"], name: "index_tasks_on_group_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role", default: "user", null: false
    t.bigint "group_id"
    t.boolean "approved", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["group_id"], name: "index_users_on_group_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bible_verses", "bible_versions"
  add_foreign_key "notices", "groups"
  add_foreign_key "notices", "users"
  add_foreign_key "prayer_requests", "groups"
  add_foreign_key "prayer_requests", "users"
  add_foreign_key "prayer_requests", "users", column: "written_for_id"
  add_foreign_key "reading_plan_days", "reading_plans"
  add_foreign_key "reading_progresses", "bible_versions"
  add_foreign_key "reading_progresses", "users"
  add_foreign_key "task_assignments", "groups"
  add_foreign_key "task_assignments", "tasks"
  add_foreign_key "task_assignments", "users"
  add_foreign_key "tasks", "groups"
  add_foreign_key "tasks", "users", column: "created_by_id"
  add_foreign_key "users", "groups"
end
