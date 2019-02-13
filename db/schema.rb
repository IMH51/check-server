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

ActiveRecord::Schema.define(version: 2019_02_11_102554) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "odds", force: :cascade do |t|
    t.integer "query_id"
    t.float "win"
    t.float "lose"
    t.float "tie"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "queries", force: :cascade do |t|
    t.integer "user_id"
    t.string "com_card1"
    t.string "com_card2"
    t.string "com_card3"
    t.string "com_card4"
    t.string "com_card5"
    t.string "hand_card1"
    t.string "hand_card2"
    t.integer "players"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
