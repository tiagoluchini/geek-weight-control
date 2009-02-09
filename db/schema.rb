# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 4) do

  create_table "logs", :force => true do |t|
    t.integer  "user_id"
    t.date     "date"
    t.float    "weight"
    t.float    "trend"
    t.integer  "lock_version", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "logs", ["user_id"], :name => "index_logs_on_user_id"
  add_index "logs", ["date"], :name => "index_logs_on_date"

  create_table "targets", :force => true do |t|
    t.integer  "user_id"
    t.date     "date"
    t.float    "weight"
    t.integer  "lock_version", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "targets", ["user_id"], :name => "index_targets_on_user_id"
  add_index "targets", ["date"], :name => "index_targets_on_date"

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.integer  "lock_version",                            :default => 0
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
