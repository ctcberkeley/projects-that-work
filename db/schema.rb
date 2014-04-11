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

ActiveRecord::Schema.define(version: 20140411064227) do

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
    t.integer  "user_id"
  end

  add_index "projects", ["user_id"], name: "index_projects_on_user_id", using: :btree

  create_table "reviews", force: true do |t|
    t.integer  "as_review_id"
    t.string   "as_review_type"
    t.integer  "overallScore"
    t.integer  "planningScore"
    t.integer  "implementationScore"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schools", force: true do |t|
    t.string   "name"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "student_reviews", force: true do |t|
    t.integer  "learningScore"
    t.integer  "impactScore"
    t.integer  "enjoyabilityScore"
    t.integer  "repeatabilityScore"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teacher_reviews", force: true do |t|
    t.integer  "educatorScore"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_sessions", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.string   "perishable_token"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "school_id"
  end

  add_index "users", ["school_id"], name: "index_users_on_school_id", using: :btree

end
