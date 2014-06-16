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

ActiveRecord::Schema.define(:version => 20131011171520) do

  create_table "categories", :force => true do |t|
    t.string   "category"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "categories", ["category"], :name => "index_categories_on_category", :unique => true

  create_table "comment_votes", :force => true do |t|
    t.integer  "comment_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "comment_votes", ["comment_id"], :name => "index_comment_votes_on_comment_id"
  add_index "comment_votes", ["user_id"], :name => "index_comment_votes_on_user_id"

  create_table "comments", :force => true do |t|
    t.text     "comment_desc"
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "comments", ["post_id"], :name => "index_comments_on_post_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "post_votes", :force => true do |t|
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "post_votes", ["post_id"], :name => "index_post_votes_on_post_id"
  add_index "post_votes", ["user_id"], :name => "index_post_votes_on_user_id"

  create_table "posts", :force => true do |t|
    t.text     "post_desc"
    t.integer  "user_id"
    t.datetime "post_date",                  :default => '2013-09-28 01:10:22'
    t.string   "tag"
    t.integer  "category_id"
    t.datetime "created_at",                                                    :null => false
    t.datetime "updated_at",                                                    :null => false
    t.integer  "weight",      :limit => 255
    t.string   "title"
  end

  add_index "posts", ["category_id"], :name => "index_posts_on_category_id"
  add_index "posts", ["user_id"], :name => "index_posts_on_user_id"

  create_table "replies", :force => true do |t|
    t.text     "reply"
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "replies", ["post_id"], :name => "index_replies_on_post_id"
  add_index "replies", ["user_id"], :name => "index_replies_on_user_id"

  create_table "reply_votes", :force => true do |t|
    t.integer  "reply_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "reply_votes", ["reply_id"], :name => "index_reply_votes_on_reply_id"
  add_index "reply_votes", ["user_id"], :name => "index_reply_votes_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "unity_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password"
    t.string   "role"
    t.datetime "last_visited",                 :default => '2013-09-26 21:54:21'
    t.datetime "created_at",                                                      :null => false
    t.datetime "updated_at",                                                      :null => false
    t.string   "session_token"
    t.boolean  "is_active",     :limit => 255, :default => true
  end

  add_index "users", ["unity_id"], :name => "index_users_on_unity_id", :unique => true

end
