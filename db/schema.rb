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

ActiveRecord::Schema.define(version: 2018_10_28_235351) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "payments", force: :cascade do |t|
    t.string "charge_id", null: false
    t.integer "user_id", null: false
    t.integer "room_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "headline"
    t.text "description"
    t.integer "price", default: 0
    t.string "youtube"
    t.string "background"
    t.string "package"
    t.json "images"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.string "activation_state"
    t.string "activation_token"
    t.datetime "activation_token_expires_at"
    t.integer "role", default: 1, null: false
    t.text "bio"
    t.string "avatar"
    t.index ["activation_token"], name: "index_users_on_activation_token"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["remember_me_token"], name: "index_users_on_remember_me_token"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token"
  end

  create_table "videos", force: :cascade do |t|
    t.string "title"
    t.string "s3_key"
    t.integer "room_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "thumbnail"
  end

end
