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

ActiveRecord::Schema.define(version: 20140214042541) do

  create_table "chains", force: true do |t|
    t.string   "title",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.string   "content",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", force: true do |t|
    t.integer  "rating_administration"
    t.integer  "rating_reliability"
    t.integer  "rating_speed"
    t.integer  "rating_other"
    t.string   "content"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "servers", force: true do |t|
    t.string   "address",                null: false
    t.string   "map"
    t.string   "region"
    t.string   "name"
    t.integer  "maxplayers"
    t.boolean  "dedicated"
    t.string   "game"
    t.string   "password"
    t.string   "tags"
    t.integer  "flags",      default: 0
    t.integer  "players",    default: 0
    t.integer  "rating"
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subforums", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.string   "name",                               null: false
    t.string   "game",       default: "unspecified", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_teams", force: true do |t|
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
