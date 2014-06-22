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

ActiveRecord::Schema.define(version: 20140622111746) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: true do |t|
    t.string   "state",      limit: 3
    t.string   "street"
    t.integer  "postcode"
    t.string   "suburb"
    t.string   "country"
    t.string   "phone"
    t.integer  "profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "addresses", ["profile_id"], name: "index_addresses_on_profile_id", using: :btree

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "electorates", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "electorates", ["name"], name: "index_electorates_on_name", unique: true, using: :btree

  create_table "electorates_postcodes", force: true do |t|
    t.integer  "electorate_id"
    t.integer  "postcode_id"
    t.float    "electorate_percent"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "electorates_postcodes", ["electorate_id"], name: "index_electorates_postcodes_on_electorate_id", using: :btree
  add_index "electorates_postcodes", ["postcode_id"], name: "index_electorates_postcodes_on_postcode_id", using: :btree

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
    t.string   "subject"
    t.text     "content"
    t.integer  "response_id"
    t.integer  "satisfaction"
    t.integer  "tone"
    t.datetime "reminder_sent_at"
    t.datetime "sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "letters", ["category_id"], name: "index_letters_on_category_id", using: :btree
  add_index "letters", ["letter_thread_id"], name: "index_letters_on_letter_thread_id", using: :btree
  add_index "letters", ["receiver_id"], name: "index_letters_on_receiver_id", using: :btree
  add_index "letters", ["response_id"], name: "index_letters_on_response_id", using: :btree
  add_index "letters", ["sender_id"], name: "index_letters_on_sender_id", using: :btree

  create_table "postcodes", force: true do |t|
    t.integer  "postcode"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "postcodes", ["postcode"], name: "index_postcodes_on_postcode", unique: true, using: :btree

  create_table "postcodes_suburbs", force: true do |t|
    t.integer  "postcode_id"
    t.integer  "suburb_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "postcodes_suburbs", ["postcode_id"], name: "index_postcodes_suburbs_on_postcode_id", using: :btree
  add_index "postcodes_suburbs", ["suburb_id"], name: "index_postcodes_suburbs_on_suburb_id", using: :btree

  create_table "profiles", force: true do |t|
    t.string   "preferred_name"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "other_names"
    t.string   "initials"
    t.string   "screen_name"
    t.string   "title"
    t.string   "gender",         limit: 2
    t.string   "dob"
    t.string   "profile_img"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "representatives", force: true do |t|
    t.integer  "electorate_id"
    t.integer  "profile_id"
    t.integer  "address_id"
    t.string   "courtesy_title"
    t.string   "honorific"
    t.string   "parlamentary_titles"
    t.string   "parlamentary_titles_short"
    t.string   "party"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "representatives", ["address_id"], name: "index_representatives_on_address_id", using: :btree
  add_index "representatives", ["electorate_id"], name: "index_representatives_on_electorate_id", using: :btree
  add_index "representatives", ["profile_id"], name: "index_representatives_on_profile_id", using: :btree

  create_table "suburbs", force: true do |t|
    t.string   "name"
    t.string   "state",      limit: 3
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.integer  "profile_id"
    t.integer  "address_id"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["address_id"], name: "index_users_on_address_id", using: :btree
  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["profile_id"], name: "index_users_on_profile_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
