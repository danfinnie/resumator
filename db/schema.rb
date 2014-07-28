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

ActiveRecord::Schema.define(version: 20140728035806) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "educations", force: true do |t|
    t.date     "obtained_at"
    t.string   "title"
    t.string   "place"
    t.string   "gpa"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "educations_resumes", id: false, force: true do |t|
    t.integer "education_id"
    t.integer "resume_id"
  end

  create_table "jobs", force: true do |t|
    t.date     "started_at"
    t.date     "ended_at"
    t.string   "title"
    t.string   "place"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "location"
  end

  create_table "jobs_resumes", id: false, force: true do |t|
    t.integer "job_id"
    t.integer "resume_id"
  end

  create_table "resumes", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "personal_website"
    t.string   "email"
    t.string   "phone"
    t.string   "first_name"
    t.string   "last_name"
  end

end
