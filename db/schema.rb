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

ActiveRecord::Schema.define(version: 20141125045657) do

  create_table "bookmarkings", force: true do |t|
    t.string   "user_id"
    t.string   "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "followings", force: true do |t|
    t.string   "user_id"
    t.string   "follow_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "post_imgs", force: true do |t|
    t.string   "image"
    t.string   "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "post_tags", force: true do |t|
    t.string   "post_id"
    t.string   "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: true do |t|
    t.string   "user_id"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at",     null: false
    t.integer  "num_recommends"
    t.string   "topic"
    t.datetime "updated_at",     null: false
  end

  create_table "read_progresses", force: true do |t|
    t.string   "post_id"
    t.string   "user_id"
    t.integer  "progress"
    t.boolean  "completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "referencings", force: true do |t|
    t.string   "post_id"
    t.string   "reference_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "respondings", force: true do |t|
    t.string   "post_id"
    t.string   "responds_to_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "tags", force: true do |t|
    t.string   "tag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "real_name"
    t.string   "prof_pic"
    t.string   "blog_name"
    t.string   "city"
    t.string   "country"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
