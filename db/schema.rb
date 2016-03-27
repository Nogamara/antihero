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

ActiveRecord::Schema.define(version: 20160326145011) do

  create_table "hero_classes", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "heroes", force: :cascade do |t|
    t.string   "name"
    t.string   "spec_name"
    t.string   "spec_url"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "level"
    t.integer  "user_id"
    t.integer  "hero_class_id"
  end

  add_index "heroes", ["hero_class_id"], name: "index_heroes_on_hero_class_id"
  add_index "heroes", ["user_id"], name: "index_heroes_on_user_id"

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.string   "item_type"
    t.string   "current"
    t.string   "note"
    t.integer  "hero_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "status"
    t.string   "ib_id"
    t.string   "current_ib_id"
    t.integer  "level"
    t.integer  "current_level"
  end

  add_index "items", ["hero_id"], name: "index_items_on_hero_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end