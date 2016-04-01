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

ActiveRecord::Schema.define(version: 20160401073311) do

  create_table "contacts", force: true do |t|
    t.string  "name"
    t.string  "email"
    t.integer "phone"
    t.string  "subject"
    t.text    "message"
  end

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "products", force: true do |t|
    t.string   "name"
    t.integer  "type_id"
    t.boolean  "is_best"
    t.text     "description"
    t.text     "use"
    t.text     "note"
    t.integer  "price"
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "services", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "price"
    t.boolean  "is_displayed", default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "type_services", force: true do |t|
    t.integer "type_id"
    t.integer "service_id"
  end

  create_table "types", force: true do |t|
    t.string  "name"
    t.string  "kind"
    t.string  "image_url"
    t.boolean "is_displayed"
  end

end
