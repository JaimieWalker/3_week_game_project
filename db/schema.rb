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

ActiveRecord::Schema.define(version: 20151028173442) do

  create_table "cards", force: :cascade do |t|
    t.string   "name"
    t.string   "value"
    t.string   "suit"
    t.boolean  "drawn",      default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "game_cards", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "card_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "game_cards", ["card_id"], name: "index_game_cards_on_card_id"
  add_index "game_cards", ["game_id"], name: "index_game_cards_on_game_id"

  create_table "games", force: :cascade do |t|
    t.string   "name"
    t.integer  "gametype_id"
    t.string   "winner"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "games", ["gametype_id"], name: "index_games_on_gametype_id"

  create_table "gametypes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_cards", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "card_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_cards", ["card_id"], name: "index_user_cards_on_card_id"
  add_index "user_cards", ["user_id"], name: "index_user_cards_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "user_name"
    t.string   "password_digest"
    t.string   "email"
    t.integer  "game_id"
    t.boolean  "dealer"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["game_id"], name: "index_users_on_game_id"

end
