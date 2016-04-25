# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160424023301) do

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

<<<<<<< HEAD
  create_table "dailyreports", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

=======
>>>>>>> 400f91e838f79b481e6b5b41f37cbc2c57a29eaf
  create_table "halls", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "intakes", force: :cascade do |t|
    t.datetime "date"
    t.string   "meal"
    t.decimal  "calories"
    t.decimal  "fat"
    t.decimal  "carb"
    t.decimal  "cholesterol"
    t.decimal  "protein"
    t.decimal  "sodium"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  add_index "intakes", ["user_id"], name: "index_intakes_on_user_id"

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.decimal  "calories"
    t.decimal  "fat",                 default: 0.0
    t.decimal  "carb",                default: 0.0
    t.decimal  "cholesterol",         default: 0.0
    t.decimal  "protein",             default: 0.0
    t.decimal  "sodium",              default: 0.0
    t.string   "location"
    t.date     "timeframe"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "nutrition_available", default: false
    t.integer  "calories_from_fat"
    t.string   "mealtime"
  end

  create_table "items_users", id: false, force: :cascade do |t|
    t.integer "item_id", null: false
    t.integer "user_id", null: false
  end

  add_index "items_users", ["item_id", "user_id"], name: "index_items_users_on_item_id_and_user_id"
  add_index "items_users", ["user_id", "item_id"], name: "index_items_users_on_user_id_and_item_id"

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
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
