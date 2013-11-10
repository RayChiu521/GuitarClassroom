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

ActiveRecord::Schema.define(version: 20131110063102) do

  create_table "groups", force: true do |t|
    t.string  "title",                    null: false
    t.boolean "is_admin", default: false
  end

  create_table "memberships", force: true do |t|
    t.integer "user_id"
    t.integer "group_id"
  end

  add_index "memberships", ["group_id"], name: "index_memberships_on_group_id", using: :btree
  add_index "memberships", ["user_id"], name: "index_memberships_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "account",                    null: false
    t.string   "password_hash"
    t.string   "nickname",      default: ""
    t.string   "gender",        default: ""
    t.string   "email",         default: ""
    t.string   "cellphone",     default: ""
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_salt"
  end

end
