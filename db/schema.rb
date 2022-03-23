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

ActiveRecord::Schema.define(version: 2022_03_23_223119) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "siren"
    t.string "address"
    t.string "city"
    t.string "country"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "licences", force: :cascade do |t|
    t.string "user_activity_status"
    t.date "licence_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.bigint "subscription_id"
    t.index ["subscription_id"], name: "index_licences_on_subscription_id"
    t.index ["user_id"], name: "index_licences_on_user_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string "name"
    t.string "provider"
    t.float "price"
    t.string "periodicity"
    t.date "subscription_date"
    t.date "renewal_date"
    t.string "link"
    t.string "payment_method"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "company_id"
    t.bigint "technical_owner_id"
    t.bigint "functional_owner_id"
    t.integer "purchased_licences"
    t.index ["company_id"], name: "index_subscriptions_on_company_id"
    t.index ["functional_owner_id"], name: "index_subscriptions_on_functional_owner_id"
    t.index ["technical_owner_id"], name: "index_subscriptions_on_technical_owner_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "team_leader_id"
    t.bigint "company_id"
    t.index ["company_id"], name: "index_teams_on_company_id"
    t.index ["team_leader_id"], name: "index_teams_on_team_leader_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "job_title"
    t.string "status"
    t.date "joining_date"
    t.bigint "team_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["team_id"], name: "index_users_on_team_id"
  end

  add_foreign_key "licences", "subscriptions"
  add_foreign_key "licences", "users"
  add_foreign_key "subscriptions", "companies"
  add_foreign_key "subscriptions", "users", column: "functional_owner_id"
  add_foreign_key "subscriptions", "users", column: "technical_owner_id"
  add_foreign_key "teams", "companies"
  add_foreign_key "teams", "users", column: "team_leader_id"
  add_foreign_key "users", "teams"
end
