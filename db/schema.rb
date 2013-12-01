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

ActiveRecord::Schema.define(version: 20131201053450) do

  create_table "arrangements", force: true do |t|
    t.integer "user_id"
    t.integer "lesson_id"
  end

  add_index "arrangements", ["lesson_id"], name: "index_arrangements_on_lesson_id", using: :btree
  add_index "arrangements", ["user_id"], name: "index_arrangements_on_user_id", using: :btree

  create_table "groups", force: true do |t|
    t.string  "title",                    null: false
    t.boolean "is_admin", default: false
  end

  create_table "lessons", force: true do |t|
    t.datetime "lesson_date"
    t.text     "content",     default: ""
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "teacher_id"
    t.datetime "beginning"
    t.datetime "ending"
    t.integer  "payment",     default: 0
  end

  add_index "lessons", ["teacher_id"], name: "index_lessons_on_teacher_id", using: :btree

  create_table "memberships", force: true do |t|
    t.integer "user_id"
    t.integer "group_id"
  end

  add_index "memberships", ["group_id"], name: "index_memberships_on_group_id", using: :btree
  add_index "memberships", ["user_id"], name: "index_memberships_on_user_id", using: :btree

  create_table "user_passwords", force: true do |t|
    t.integer  "user_id"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_passwords", ["user_id"], name: "index_user_passwords_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "account",                 null: false
    t.string   "nickname",   default: ""
    t.string   "gender",     default: ""
    t.string   "email",      default: ""
    t.string   "cellphone",  default: ""
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
