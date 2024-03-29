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

ActiveRecord::Schema.define(version: 20140612191031) do

  create_table "accttypes", force: true do |t|
    t.integer  "user_id"
    t.string   "accttype"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "environments", force: true do |t|
    t.integer  "user_id"
    t.string   "environment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "oausers", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.integer  "user_id"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sshkeys", force: true do |t|
    t.integer  "user_id"
    t.text     "key",        limit: 1000
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "keytype"
  end

  create_table "uids", force: true do |t|
    t.integer  "user_id"
    t.integer  "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "ingroups"
    t.string   "shell"
    t.string   "password"
    t.string   "realname"
    t.string   "ensure"
    t.string   "ldapowner"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
