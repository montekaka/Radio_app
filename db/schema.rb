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

ActiveRecord::Schema.define(:version => 20130919194648) do

  create_table "audioposts", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "short_note"
    t.string   "audio"
    t.date     "audio_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "show_id"
    t.string   "soundfile_file_name"
    t.string   "soundfile_content_type"
    t.integer  "soundfile_file_size"
    t.datetime "soundfile_updated_at"
    t.string   "cast_remote_url"
  end

  create_table "shows", :force => true do |t|
    t.string   "name"
    t.string   "category"
    t.text     "description"
    t.string   "djname"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "show_url"
    t.integer  "station_id"
    t.integer  "user_id"
  end

  create_table "stations", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "station_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "cursor"
    t.string   "token"
    t.string   "dropbox_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
