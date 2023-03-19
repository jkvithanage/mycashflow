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

ActiveRecord::Schema[7.0].define(version: 2023_01_11_220726) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_enum :account_type, [
    "checking",
    "savings",
  ], force: :cascade

  create_enum :bank_name, [
    "westpac",
    "commonwealth",
    "anz",
    "nab",
  ], force: :cascade

  create_enum :transaction_type, [
    "debit",
    "credit",
  ], force: :cascade

  create_table "accounts", force: :cascade do |t|
    t.string "name"
    t.enum "account_type", null: false, enum_type: "account_type"
    t.enum "bank_name", null: false, enum_type: "bank_name"
    t.string "account_number"
    t.string "owner_name"
    t.decimal "current_balance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_categories_on_user_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.datetime "date"
    t.string "description"
    t.enum "transaction_type", null: false, enum_type: "transaction_type"
    t.decimal "amount"
    t.string "notes"
    t.bigint "account_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_transactions_on_account_id"
    t.index ["category_id"], name: "index_transactions_on_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "accounts", "users"
  add_foreign_key "categories", "users"
  add_foreign_key "transactions", "accounts"
  add_foreign_key "transactions", "categories"
end
