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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131116222122) do

  create_table "comments", :force => true do |t|
    t.integer  "comment_id"
    t.string   "user_name"
    t.integer  "update_id"
    t.integer  "level_id"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "levels", :force => true do |t|
    t.integer  "level_ID"
    t.string   "user_name"
    t.integer  "avg_rating"
    t.string   "title"
    t.text     "description"
    t.string   "type"
    t.integer  "restriction"
    t.text     "level_string"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ratings", :force => true do |t|
    t.integer  "rating_id"
    t.string   "user_name"
    t.integer  "level_id"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scores", :force => true do |t|
    t.integer  "score_id"
    t.string   "user_name"
    t.integer  "level_id"
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "updates", :force => true do |t|
    t.integer  "update_id"
    t.string   "title"
    t.text     "description"
    t.string   "user_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "user_name"
    t.string   "email"
    t.datetime "birth_date"
    t.string   "status"
    t.text     "slogan"
    t.integer  "reputation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
