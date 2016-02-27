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

ActiveRecord::Schema.define(version: 20160227193522) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string   "title"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "country"
    t.string   "city"
    t.string   "venue"
    t.text     "description"
    t.integer  "trip_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["trip_id"], name: "index_activities_on_trip_id", using: :btree

  create_table "friendships", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "friend_id"
  end

  add_index "friendships", ["friend_id"], name: "index_friendships_on_friend_id", using: :btree
  add_index "friendships", ["user_id"], name: "index_friendships_on_user_id", using: :btree

  create_table "photos", force: :cascade do |t|
    t.string   "safe_url"
    t.text     "caption"
    t.integer  "activity_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cloudinary_id"
  end

  add_index "photos", ["activity_id"], name: "index_photos_on_activity_id", using: :btree

  create_table "trips", force: :cascade do |t|
    t.string   "title"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "location"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "trips", ["user_id"], name: "index_trips_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.date     "birthday"
    t.string   "email"
    t.string   "photo"
    t.string   "location"
    t.text     "about_me"
    t.text     "quirky_fact"
    t.string   "facebook_id"
    t.string   "google_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
