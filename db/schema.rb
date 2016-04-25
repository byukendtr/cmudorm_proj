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

ActiveRecord::Schema.define(version: 20160425164020) do

  create_table "activities", id: false, force: :cascade do |t|
    t.string   "Activity_name",  limit: 50, null: false
    t.datetime "Schedule",                  null: false
    t.integer  "Activity_point", limit: 4,  null: false
    t.string   "Attending",      limit: 9,  null: false
  end

  create_table "admin", id: false, force: :cascade do |t|
    t.string   "AdminID",   limit: 5, null: false
    t.datetime "startDate",           null: false
    t.datetime "quitDate",            null: false
  end

  create_table "dormitory", id: false, force: :cascade do |t|
    t.string "dormName", limit: 50, null: false
  end

  create_table "par_of_stu", id: false, force: :cascade do |t|
    t.string "par_name", limit: 50, null: false
    t.string "stu_id",   limit: 9,  null: false
  end

  create_table "parentcontact", id: false, force: :cascade do |t|
    t.string "parentName", limit: 50, null: false
    t.string "relation",   limit: 10, null: false
    t.string "phone",      limit: 10, null: false
  end

  create_table "person", primary_key: "CitizenID", force: :cascade do |t|
    t.string "Title",     limit: 6,   null: false
    t.string "Firstname", limit: 50,  null: false
    t.string "Lastname",  limit: 50,  null: false
    t.string "Address",   limit: 150, null: false
    t.date   "Birthday",              null: false
    t.string "Phone",     limit: 10,  null: false
    t.string "Email",     limit: 50,  null: false
  end

  add_index "person", ["CitizenID"], name: "fk_students", unique: true, using: :btree

  create_table "room", id: false, force: :cascade do |t|
    t.string  "room_no",     limit: 3,  null: false
    t.integer "room_status", limit: 4,  null: false
    t.string  "inDorm",      limit: 50, null: false
  end

  create_table "students", primary_key: "StudentID", force: :cascade do |t|
    t.string   "student_citizenID", limit: 13, null: false
    t.string   "reserveRoom",       limit: 3
    t.datetime "checkoutTime"
    t.datetime "reserveTime"
  end

  add_index "students", ["student_citizenID"], name: "fk", unique: true, using: :btree

  add_foreign_key "person", "students", column: "CitizenID", primary_key: "student_citizenID", name: "fk_student"
end
