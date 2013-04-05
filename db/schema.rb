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

ActiveRecord::Schema.define(:version => 20130405003926) do

  create_table "addresses", :force => true do |t|
    t.string   "name"
    t.string   "street1"
    t.string   "street2"
    t.string   "city"
    t.string   "state",      :limit => 2
    t.string   "zip",        :limit => 5
    t.string   "county"
    t.integer  "user_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "addresses", ["user_id"], :name => "index_addresses_on_user_id"

  create_table "contact_informations", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "middle_initial", :limit => 1
    t.string   "home_phone"
    t.string   "mobile_phone"
    t.string   "contact_email"
    t.string   "url"
    t.string   "github"
    t.string   "linkedin"
    t.string   "twitter"
    t.string   "instagram"
    t.string   "facebook"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.integer  "user_id"
  end

  create_table "cvs", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "target"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "cvs", ["user_id"], :name => "index_cvs_on_user_id"

  create_table "cvs_sections", :force => true do |t|
    t.integer "cv_id"
    t.integer "section_id"
  end

  add_index "cvs_sections", ["cv_id", "section_id"], :name => "index_cvs_sections_on_cv_id_and_section_id", :unique => true

  create_table "experiences", :force => true do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.string   "title"
    t.string   "department"
    t.string   "company"
    t.integer  "experienceable_id"
    t.string   "experienceable_type"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "items", :force => true do |t|
    t.string   "description"
    t.integer  "section_id"
    t.string   "type"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "items", ["section_id"], :name => "index_items_on_section_id"

  create_table "people", :force => true do |t|
    t.string   "first_name", :limit => 64
    t.string   "last_name",  :limit => 64
    t.string   "type",       :limit => 64
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "sections", :force => true do |t|
    t.integer  "parent_id"
    t.string   "header"
    t.string   "type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "position"
  end

  add_index "sections", ["parent_id"], :name => "index_sections_on_section_id"

  create_table "users", :force => true do |t|
    t.string   "email",                                :default => "", :null => false
    t.string   "encrypted_password",                   :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
    t.string   "handle",                 :limit => 64
  end

  add_index "users", ["email"], :name => "index_authentications_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_authentications_on_reset_password_token", :unique => true

end
