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

ActiveRecord::Schema.define(version: 20140524210256) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "project_classes", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "teacher_id"
    t.integer  "student_project_class_id"
    t.string   "password"
    t.integer  "project_id"
  end

  add_index "project_classes", ["project_id"], name: "index_project_classes_on_project_id", using: :btree
  add_index "project_classes", ["student_project_class_id"], name: "index_project_classes_on_student_project_class_id", using: :btree
  add_index "project_classes", ["teacher_id"], name: "index_project_classes_on_teacher_id", using: :btree

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
    t.integer  "duration"
    t.integer  "grade"
    t.string   "course"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "teacher_id"
    t.string   "scale"
    t.string   "learningStandards"
    t.string   "conclusion",        default: [], array: true
    t.string   "materials"
    t.string   "projectType"
    t.text     "preparation",       default: [], array: true
  end

  add_index "projects", ["teacher_id"], name: "index_projects_on_teacher_id", using: :btree

  create_table "reviews", force: true do |t|
    t.integer  "as_review_id"
    t.string   "as_review_type"
    t.integer  "overallScore"
    t.integer  "planningScore"
    t.integer  "implementationScore"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "project_id"
    t.integer  "reviewable_id"
    t.string   "reviewable_type"
  end

  add_index "reviews", ["project_id"], name: "index_reviews_on_project_id", using: :btree
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

  create_table "schools", force: true do |t|
    t.string   "name"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "student_project_classes", force: true do |t|
    t.integer  "student_id",       null: false
    t.integer  "project_class_id", null: false
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

  create_table "students", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "students", ["user_id"], name: "index_students_on_user_id", using: :btree

  create_table "teacher_reviews", force: true do |t|
    t.integer  "educatorScore"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teachers", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "project_id"
    t.integer  "project_class_id"
  end

  add_index "teachers", ["project_class_id"], name: "index_teachers_on_project_class_id", using: :btree
  add_index "teachers", ["project_id"], name: "index_teachers_on_project_id", using: :btree
  add_index "teachers", ["user_id"], name: "index_teachers_on_user_id", using: :btree

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
    t.integer  "review_id"
  end

  add_index "users", ["review_id"], name: "index_users_on_review_id", using: :btree
  add_index "users", ["school_id"], name: "index_users_on_school_id", using: :btree

end
