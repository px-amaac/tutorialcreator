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

ActiveRecord::Schema.define(version: 20141211095833) do

  create_table "codeblocks", force: true do |t|
    t.text     "code"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "step_id"
    t.string   "file_name"
  end

  add_index "codeblocks", ["step_id"], name: "index_codeblocks_on_step_id"

  create_table "screenshots", force: true do |t|
    t.string   "caption"
    t.text     "description"
    t.integer  "step_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "screenshots", ["step_id"], name: "index_screenshots_on_step_id"

  create_table "sections", force: true do |t|
    t.integer  "step_id"
    t.integer  "item_id"
    t.string   "item_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sections", ["item_id", "item_type"], name: "index_sections_on_item_id_and_item_type"
  add_index "sections", ["step_id"], name: "index_sections_on_step_id"

  create_table "steps", force: true do |t|
    t.string   "title"
    t.text     "problem"
    t.text     "solution"
    t.integer  "tutorial_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "steps", ["tutorial_id"], name: "index_steps_on_tutorial_id"

  create_table "tutorial_step_relationships", force: true do |t|
    t.integer "tutorial_id"
    t.integer "step_id"
  end

  add_index "tutorial_step_relationships", ["step_id"], name: "index_tutorial_step_relationships_on_step_id"
  add_index "tutorial_step_relationships", ["tutorial_id"], name: "index_tutorial_step_relationships_on_tutorial_id"

  create_table "tutorials", force: true do |t|
    t.string   "title"
    t.string   "author"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tutorials", ["user_id"], name: "index_tutorials_on_user_id"

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
