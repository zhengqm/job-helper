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

ActiveRecord::Schema.define(version: 20150804085650) do

  create_table "phases", force: :cascade do |t|
    t.string   "description", limit: 255, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "stage",       limit: 4
  end

  add_index "phases", ["stage"], name: "index_phases_on_stage", using: :btree

  create_table "positions", force: :cascade do |t|
    t.string   "name",             limit: 255
    t.string   "company",          limit: 255
    t.text     "description",      limit: 16777215
    t.integer  "user_id",          limit: 4
    t.text     "note",             limit: 16777215
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "phase_id",         limit: 4
    t.datetime "deadline"
    t.integer  "current_step",     limit: 4
    t.string   "step_description", limit: 255
    t.float    "progress",         limit: 24
  end

  add_index "positions", ["user_id"], name: "index_positions_on_user_id", using: :btree

  create_table "steps", force: :cascade do |t|
    t.integer  "position_id", limit: 4
    t.integer  "phase_id",    limit: 4
    t.integer  "steps",       limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",           limit: 255, null: false
    t.string   "password_digest", limit: 255, null: false
    t.string   "username",        limit: 255, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

end
