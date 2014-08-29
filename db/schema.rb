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

ActiveRecord::Schema.define(version: 20140829171538) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "admins_roles", id: false, force: true do |t|
    t.integer "admin_id"
    t.integer "role_id"
  end

  add_index "admins_roles", ["admin_id", "role_id"], name: "index_admins_roles_on_admin_id_and_role_id", using: :btree

  create_table "employees", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "title"
    t.string   "assignment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "meta", force: true do |t|
    t.integer  "page_id"
    t.string   "descriptive_title"
    t.string   "author"
    t.string   "keywords"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "newsletters", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", force: true do |t|
    t.string   "permalink"
    t.text     "header_content"
    t.integer  "position"
    t.boolean  "published"
    t.string   "icon_uid"
    t.string   "icon_name"
    t.string   "background_uid"
    t.string   "background_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pages", ["permalink"], name: "index_pages_on_permalink", using: :btree
  add_index "pages", ["position"], name: "index_pages_on_position", using: :btree

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "sections", force: true do |t|
    t.string   "section_title"
    t.integer  "page_id"
    t.text     "content"
    t.string   "image_uid"
    t.string   "image_name"
    t.string   "background_uid"
    t.string   "background_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "supports", force: true do |t|
    t.string   "ticket"
    t.integer  "admin_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", force: true do |t|
    t.string   "name"
    t.string   "note"
    t.integer  "admin_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
