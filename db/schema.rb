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

ActiveRecord::Schema.define(version: 20150928074027) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "optimadmin_administrators", force: :cascade do |t|
    t.string   "username",               null: false
    t.string   "email",                  null: false
    t.string   "role",                   null: false
    t.string   "auth_token"
    t.string   "password_digest",        null: false
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "optimadmin_administrators", ["auth_token"], name: "index_optimadmin_administrators_on_auth_token", using: :btree
  add_index "optimadmin_administrators", ["email"], name: "index_optimadmin_administrators_on_email", using: :btree
  add_index "optimadmin_administrators", ["username"], name: "index_optimadmin_administrators_on_username", using: :btree

  create_table "optimadmin_documents", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "document",    null: false
    t.string   "module_name"
    t.integer  "module_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "optimadmin_external_links", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "optimadmin_images", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "image",       null: false
    t.string   "module_name"
    t.integer  "module_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "optimadmin_links", force: :cascade do |t|
    t.string   "menu_resource_type"
    t.integer  "menu_resource_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "optimadmin_menu_item_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id",   null: false
    t.integer "descendant_id", null: false
    t.integer "generations",   null: false
  end

  add_index "optimadmin_menu_item_hierarchies", ["ancestor_id", "descendant_id", "generations"], name: "menu_item_anc_desc_idx", unique: true, using: :btree
  add_index "optimadmin_menu_item_hierarchies", ["descendant_id"], name: "menu_item_desc_idx", using: :btree

  create_table "optimadmin_menu_items", force: :cascade do |t|
    t.string   "menu_name",       limit: 100
    t.string   "name",            limit: 100
    t.integer  "parent_id"
    t.boolean  "deletable",                   default: true
    t.boolean  "new_window",                  default: false
    t.string   "title_attribute", limit: 100
    t.integer  "position",                    default: 0
    t.integer  "link_id"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "optimadmin_menu_items", ["link_id"], name: "index_optimadmin_menu_items_on_link_id", using: :btree

  create_table "optimadmin_module_pages", force: :cascade do |t|
    t.string   "name"
    t.string   "route"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "optimadmin_site_settings", force: :cascade do |t|
    t.string "key"
    t.string "value"
    t.string "environment"
  end

end
