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

ActiveRecord::Schema.define(version: 20140313220548) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "project_plans", force: true do |t|
    t.string   "projectSteps"
    t.string   "learningGoals"
    t.string   "fundraisingStrat"
    t.string   "assessment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.string   "name"
    t.date     "startDate"
    t.date     "endDate"
    t.integer  "duration"
    t.integer  "grade"
    t.string   "course"
    t.integer  "numStudents"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
