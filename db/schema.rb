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

ActiveRecord::Schema.define(version: 20170113002654) do

  create_table "categories", force: :cascade do |t|
    t.string   "categoryname"
    t.integer  "user_id"
    t.boolean  "dcheck"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "how_tos", force: :cascade do |t|
    t.binary   "htimg1"
    t.binary   "htimg2"
    t.binary   "htimg3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string   "itemname"
    t.binary   "image"
    t.binary   "image2"
    t.binary   "image3"
    t.boolean  "itemcall"
    t.boolean  "situ"
    t.string   "ani"
    t.date     "day"
    t.integer  "category_id"
    t.boolean  "fav"
    t.integer  "user_id"
    t.boolean  "shere"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true

  create_table "users", force: :cascade do |t|
    t.string   "userid"
    t.string   "name"
    t.string   "pass"
    t.string   "mail"
    t.string   "mailback"
    t.string   "color"
    t.integer  "call"
    t.integer  "cnt",        default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
