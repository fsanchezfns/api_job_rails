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

ActiveRecord::Schema.define(version: 2021_12_17_024927) do

  create_table "candidates", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.string "lastname"
    t.date "birth_date"
    t.string "observations"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_candidates_on_user_id"
  end

  create_table "enterprises", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.string "nationality"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_enterprises_on_user_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.integer "enterprise_id"
    t.string "name"
    t.string "description"
    t.string "requirements"
    t.string "time"
    t.boolean "enable", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["enterprise_id"], name: "index_jobs_on_enterprise_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer "job_id"
    t.integer "candidate_id"
    t.string "state"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["candidate_id"], name: "index_subscriptions_on_candidate_id"
    t.index ["job_id"], name: "index_subscriptions_on_job_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.string "token"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
