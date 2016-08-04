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

ActiveRecord::Schema.define(version: 20160803125755) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "aqmesh_channels", force: :cascade do |t|
    t.integer  "aqmesh_datum_id"
    t.float    "pre_scaled"
    t.float    "scaled"
    t.float    "final"
    t.float    "offset"
    t.float    "slope"
    t.float    "status"
    t.string   "unit"
    t.string   "sensor"
    t.string   "label"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "aqmesh_channels", ["aqmesh_datum_id"], name: "index_aqmesh_channels_on_aqmesh_datum_id", using: :btree

  create_table "aqmesh_data", force: :cascade do |t|
    t.string   "timestamp"
    t.string   "display_type"
    t.float    "battery"
    t.string   "particle_protocol"
    t.string   "gas_protocol"
    t.string   "P1"
    t.string   "P2"
    t.string   "P3"
    t.string   "T1"
    t.string   "T2"
    t.string   "T3"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "aqmesh_data", ["timestamp"], name: "index_aqmesh_data_on_timestamp", unique: true, using: :btree

  create_table "sensors", force: :cascade do |t|
    t.string   "name"
    t.string   "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sensors", ["name"], name: "index_sensors_on_name", unique: true, using: :btree

  create_table "servers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "servers", ["name"], name: "index_servers_on_name", unique: true, using: :btree

  create_table "stations", force: :cascade do |t|
    t.string   "name"
    t.string   "serial_number"
    t.integer  "server_id"
    t.string   "type"
    t.boolean  "active"
    t.boolean  "external"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "stations", ["name"], name: "index_stations_on_name", unique: true, using: :btree
  add_index "stations", ["server_id"], name: "index_stations_on_server_id", using: :btree

  create_table "units", force: :cascade do |t|
    t.string   "name"
    t.string   "unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "units", ["name"], name: "index_units_on_name", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "aqmesh_channels", "aqmesh_data"
  add_foreign_key "stations", "servers"
end
