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

ActiveRecord::Schema.define(version: 20140614035741) do

  create_table "addresses", force: true do |t|
    t.string   "state",      limit: 3
    t.string   "street"
    t.integer  "postcode"
    t.string   "city"
    t.string   "country"
    t.string   "phone"
    t.string   "mobile"
    t.integer  "profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "addresses", ["profile_id"], name: "index_addresses_on_profile_id"

  create_table "boundaries", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "boundary_postcodes", force: true do |t|
    t.integer  "postcode"
    t.string   "suburb"
    t.string   "state",       limit: 3
    t.float    "percentage"
    t.integer  "boundary_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "boundary_postcodes", ["boundary_id"], name: "index_boundary_postcodes_on_boundary_id"

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "letter_threads", force: true do |t|
    t.boolean  "closed"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "letters", force: true do |t|
    t.integer  "letter_thread_id"
    t.integer  "category_id"
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.text     "content"
    t.integer  "response_id"
    t.integer  "satisfaction"
    t.datetime "reminder_sent_at"
    t.datetime "sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "letters", ["category_id"], name: "index_letters_on_category_id"
  add_index "letters", ["letter_thread_id"], name: "index_letters_on_letter_thread_id"
  add_index "letters", ["receiver_id"], name: "index_letters_on_receiver_id"
  add_index "letters", ["response_id"], name: "index_letters_on_response_id"
  add_index "letters", ["sender_id"], name: "index_letters_on_sender_id"

  create_table "profiles", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "screen_name"
    t.string   "title",       limit: 10
    t.string   "gender",      limit: 2
    t.string   "dob"
    t.string   "profile_img"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "representatives", force: true do |t|
    t.integer  "profile_id"
    t.integer  "address_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "representatives", ["address_id"], name: "index_representatives_on_address_id"
  add_index "representatives", ["profile_id"], name: "index_representatives_on_profile_id"

  create_table "users", force: true do |t|
    t.integer  "profile_id"
    t.integer  "address_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["address_id"], name: "index_users_on_address_id"
  add_index "users", ["profile_id"], name: "index_users_on_profile_id"

end
