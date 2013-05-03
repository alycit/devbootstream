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

ActiveRecord::Schema.define(:version => 20130503175906) do

  create_table "boots", :force => true do |t|
    t.string   "name",        :null => false
    t.integer  "socrates_id", :null => false
    t.integer  "cohort_id",   :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "boots", ["cohort_id"], :name => "index_boots_on_cohort_id"

  create_table "cohorts", :force => true do |t|
    t.string   "name",               :null => false
    t.date     "start_date",         :null => false
    t.integer  "socrates_cohort_id", :null => false
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "posts", :force => true do |t|
    t.string   "url"
    t.string   "title"
    t.text     "body"
    t.string   "media_type",  :null => false
    t.integer  "resource_id", :null => false
    t.datetime "posted_at",   :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "posts", ["resource_id"], :name => "index_posts_on_resource_id"

  create_table "resources", :force => true do |t|
    t.integer  "boot_id"
    t.string   "identifier"
    t.string   "user_name"
    t.string   "source",          :null => false
    t.string   "profile_pic_url"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "resources", ["boot_id"], :name => "index_resources_on_boot_id"

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

end
