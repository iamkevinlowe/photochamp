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

ActiveRecord::Schema.define(version: 20150804232635) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "challenges", force: :cascade do |t|
    t.integer  "challenger_id"
    t.integer  "challenged_id"
    t.integer  "votes_challenger"
    t.integer  "votes_challenged"
    t.integer  "length"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.boolean  "completed"
    t.datetime "ends_at"
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "photo_id"
    t.integer  "user_id"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["photo_id"], name: "index_comments_on_photo_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "favorites", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "photo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "favorites", ["photo_id"], name: "index_favorites_on_photo_id"
  add_index "favorites", ["user_id"], name: "index_favorites_on_user_id"

  create_table "photos", force: :cascade do |t|
    t.string   "file"
    t.integer  "win"
    t.integer  "loss"
    t.integer  "tie"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "category_id"
    t.string   "name"
    t.float    "rank"
  end

  add_index "photos", ["category_id"], name: "index_photos_on_category_id"
  add_index "photos", ["user_id"], name: "index_photos_on_user_id"

  create_table "reports", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "photo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "reports", ["photo_id"], name: "index_reports_on_photo_id"
  add_index "reports", ["user_id"], name: "index_reports_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "role"
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "stripe_customer_id"
    t.boolean  "banned",                 default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
