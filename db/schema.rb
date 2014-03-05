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

ActiveRecord::Schema.define(version: 20140305155222) do

  create_table "reviews", force: true do |t|
    t.integer  "rating_administration"
    t.integer  "rating_reliability"
    t.integer  "rating_speed"
    t.integer  "rating_other"
    t.string   "content"
    t.string   "title"
    t.integer  "tf2_server_id",         null: false
    t.integer  "user_id",               null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stats", force: true do |t|
    t.integer  "tot_hours"
    t.integer  "tot_kills"
    t.integer  "tot_points"
    t.integer  "class_scout_hours"
    t.integer  "class_scout_kills"
    t.integer  "class_scout_points"
    t.integer  "class_soldier_hours"
    t.integer  "class_soldier_kills"
    t.integer  "class_soldier_points"
    t.integer  "class_pyro_hours"
    t.integer  "class_pyro_kills"
    t.integer  "class_pyro_points"
    t.integer  "class_demo_hours"
    t.integer  "class_demo_kills"
    t.integer  "class_demo_points"
    t.integer  "class_heavy_hours"
    t.integer  "class_heavy_kills"
    t.integer  "class_heavy_points"
    t.integer  "class_engineer_hours"
    t.integer  "class_engineer_kills"
    t.integer  "class_engineer_points"
    t.integer  "class_medic_hours"
    t.integer  "class_medic_kills"
    t.integer  "class_medic_points"
    t.integer  "class_sniper_hours"
    t.integer  "class_sniper_kills"
    t.integer  "class_sniper_points"
    t.integer  "class_spy_hours"
    t.integer  "class_spy_kills"
    t.integer  "class_spy_points"
    t.string   "most_played_class"
    t.string   "most_successful_class"
    t.integer  "user_id",               null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.string   "name",                                  null: false
    t.string   "game",          default: "unspecified", null: false
    t.integer  "captain"
    t.boolean  "playing"
    t.boolean  "temporary"
    t.string   "color"
    t.integer  "tf2_server_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "teams", ["name"], name: "index_teams_on_name", unique: true

  create_table "tf2_servers", force: true do |t|
    t.string   "address",                            null: false
    t.string   "map"
    t.string   "region"
    t.string   "name"
    t.integer  "maxplayers"
    t.boolean  "dedicated"
    t.integer  "free_spots"
    t.integer  "players",    default: 0
    t.string   "game",       default: "unspecified", null: false
    t.string   "password"
    t.boolean  "playing"
    t.string   "tags"
    t.integer  "flags",      default: 0
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tf2_servers", ["address"], name: "index_tf2_servers_on_address", unique: true

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "username",                            null: false
    t.string   "steam_link",                          null: false
    t.string   "region"
    t.integer  "class_scout",            default: 1,  null: false
    t.integer  "class_soldier",          default: 1,  null: false
    t.integer  "class_pyro",             default: 1,  null: false
    t.integer  "class_demo",             default: 1,  null: false
    t.integer  "class_heavy",            default: 1,  null: false
    t.integer  "class_engineer",         default: 1,  null: false
    t.integer  "class_medic",            default: 1,  null: false
    t.integer  "class_sniper",           default: 1,  null: false
    t.integer  "class_spy",              default: 1,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["steam_link"], name: "index_users_on_steam_link", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

  create_table "users_teams", force: true do |t|
    t.string   "role"
    t.integer  "user_id",    null: false
    t.integer  "team_id",    null: false
    t.boolean  "accepted"
    t.boolean  "ready"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
