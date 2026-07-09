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

ActiveRecord::Schema[7.2].define(version: 2026_06_30_062538) do
  create_table "claims", force: :cascade do |t|
    t.string "debtor_name"
    t.string "content"
    t.integer "amount"
    t.text "note"
    t.boolean "has_document"
    t.date "last_checked_on"
    t.integer "client_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_claims_on_client_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.date "birthdate"
    t.string "address"
    t.string "case_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_clients_on_user_id"
  end

  create_table "debts", force: :cascade do |t|
    t.string "creditor_name"
    t.string "content"
    t.integer "amount"
    t.boolean "has_document"
    t.date "last_checked_on"
    t.integer "client_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "monthly_payment"
    t.index ["client_id"], name: "index_debts_on_client_id"
  end

  create_table "deposits", force: :cascade do |t|
    t.string "bank_name"
    t.string "branch_name"
    t.string "account_type"
    t.string "account_number"
    t.date "last_checked_on"
    t.integer "balance"
    t.string "manager"
    t.integer "client_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "deposit_type"
    t.string "facility_name"
    t.boolean "has_document"
    t.index ["client_id"], name: "index_deposits_on_client_id"
  end

  create_table "inheritance_properties", force: :cascade do |t|
    t.string "status"
    t.date "last_checked_on"
    t.integer "client_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_inheritance_properties_on_client_id"
  end

  create_table "insurances", force: :cascade do |t|
    t.string "insurance_company"
    t.string "insurance_kind"
    t.string "policy_number"
    t.decimal "amount"
    t.string "contractor"
    t.string "beneficiary"
    t.boolean "has_document"
    t.date "last_checked_on"
    t.integer "client_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_insurances_on_client_id"
  end

  create_table "other_properties", force: :cascade do |t|
    t.string "kind"
    t.string "content"
    t.integer "value"
    t.text "note"
    t.boolean "has_document"
    t.date "last_checked_on"
    t.integer "client_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_other_properties_on_client_id"
  end

  create_table "real_estates", force: :cascade do |t|
    t.string "estate_type"
    t.string "address"
    t.string "lot_number"
    t.string "land_category"
    t.float "area"
    t.string "building_number"
    t.string "building_kind"
    t.float "floor_area"
    t.text "note"
    t.boolean "has_document"
    t.date "last_checked_on"
    t.integer "client_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_real_estates_on_client_id"
  end

  create_table "securities", force: :cascade do |t|
    t.string "security_kind"
    t.string "security_name"
    t.string "amount"
    t.string "manager"
    t.integer "client_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "security_last_checked_on"
    t.decimal "quantity", precision: 15, scale: 2
    t.decimal "face_value", precision: 15, scale: 2
    t.boolean "has_document", default: false
    t.string "unit"
    t.index ["client_id"], name: "index_securities_on_client_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "claims", "clients"
  add_foreign_key "clients", "users"
  add_foreign_key "debts", "clients"
  add_foreign_key "deposits", "clients"
  add_foreign_key "inheritance_properties", "clients"
  add_foreign_key "insurances", "clients"
  add_foreign_key "other_properties", "clients"
  add_foreign_key "real_estates", "clients"
  add_foreign_key "securities", "clients"
end
