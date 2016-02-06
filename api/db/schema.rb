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

ActiveRecord::Schema.define(version: 20160206150206) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "drops", force: :cascade do |t|
    t.datetime "end_at"
    t.string   "state"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "drops", ["product_id"], name: "index_drops_on_product_id", using: :btree

  create_table "polls", force: :cascade do |t|
    t.string   "state"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "polls", ["product_id"], name: "index_polls_on_product_id", using: :btree

  create_table "product_images", id: false, force: :cascade do |t|
    t.string   "image_id"
    t.boolean  "main_image", default: false
    t.integer  "product_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "product_images", ["product_id"], name: "index_product_images_on_product_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.decimal  "msrp"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_foreign_key "drops", "products"
  add_foreign_key "polls", "products"
  add_foreign_key "product_images", "products"
end
