# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170413064719) do

  create_table "admins", force: :cascade do |t|
    t.string   "email"
    t.string   "encrypted_password"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "properties", force: :cascade do |t|
    t.integer  "Code"
    t.string   "County"
    t.decimal  "Price",        precision: 8, scale: 2
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.decimal  "CurrentPrice", precision: 8, scale: 2
    t.integer  "Shares"
    t.decimal  "Rate",         precision: 8, scale: 2
    t.decimal  "ShareValue",   precision: 8, scale: 2
    t.string   "locality"
    t.string   "LR"
    t.string   "Title"
    t.string   "Reason"
    t.date     "StartOffer"
    t.date     "EndOffer"
    t.integer  "user_id"
    t.string   "Area_of_land"
    t.string   "brochure"
    t.index ["user_id"], name: "index_properties_on_user_id"
  end

  create_table "share_buy_requests", force: :cascade do |t|
    t.integer  "property_id"
    t.integer  "user_id"
    t.integer  "no_of_shares"
    t.datetime "created_at",                                                    null: false
    t.datetime "updated_at",                                                    null: false
    t.boolean  "status",                                        default: false
    t.integer  "share_sell_request_id"
    t.decimal  "total",                 precision: 8, scale: 2
    t.string   "transaction_id"
    t.index ["share_sell_request_id"], name: "index_share_buy_requests_on_share_sell_request_id"
  end

  create_table "share_sell_requests", force: :cascade do |t|
    t.integer  "property_id"
    t.integer  "user_id"
    t.integer  "no_of_shares"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "sale_price"
    t.boolean  "status",        default: false
    t.date     "validity_days"
  end

  create_table "shares", force: :cascade do |t|
    t.string   "code"
    t.decimal  "value"
    t.date     "period"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "property_id"
    t.integer  "user_id"
    t.boolean  "status",                default: false
    t.integer  "share_buy_request_id"
    t.integer  "share_sell_request_id"
    t.string   "cert_code"
    t.index ["property_id"], name: "index_shares_on_property_id"
    t.index ["share_buy_request_id"], name: "index_shares_on_share_buy_request_id"
    t.index ["share_sell_request_id"], name: "index_shares_on_share_sell_request_id"
    t.index ["user_id"], name: "index_shares_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "superadmin_role",        default: false
    t.boolean  "supervisor_role",        default: false
    t.boolean  "user_role",              default: true
    t.string   "full_name"
    t.string   "guardian"
    t.string   "country"
    t.string   "mobile_no"
    t.string   "member_code"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "id_no"
    t.string   "advisor"
    t.string   "advisor_code"
    t.string   "nok"
    t.string   "nok_id"
    t.string   "nok_mobile"
    t.string   "address"
    t.string   "bank"
    t.string   "bank_branch"
    t.string   "bank_ac"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
