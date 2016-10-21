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

ActiveRecord::Schema.define(version: 20161021043843) do

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_categories_on_name", unique: true, using: :btree
  end

  create_table "collaboration_projects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "hackathon_id", null: false
    t.integer  "idea_id",      null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["hackathon_id"], name: "index_collaboration_projects_on_hackathon_id", using: :btree
    t.index ["idea_id"], name: "index_collaboration_projects_on_idea_id", using: :btree
  end

  create_table "collaborations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "idea_id",    null: false
    t.integer  "hacker_id",  null: false
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hacker_id"], name: "index_collaborations_on_hacker_id", using: :btree
    t.index ["idea_id"], name: "index_collaborations_on_idea_id", using: :btree
  end

  create_table "hackathons", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title",      null: false
    t.date     "start_date", null: false
    t.date     "end_date",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title"], name: "index_hackathons_on_title", unique: true, using: :btree
  end

  create_table "hackers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                                default: "", null: false
    t.string   "encrypted_password",                   default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name",                                              null: false
    t.string   "department"
    t.text     "specialties",            limit: 65535
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.index ["email"], name: "index_hackers_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_hackers_on_reset_password_token", unique: true, using: :btree
  end

  create_table "ideas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "category_id"
    t.integer  "hacker_id"
    t.integer  "status",                    default: 0
    t.integer  "progress",                  default: 0
    t.string   "title"
    t.string   "description"
    t.text     "specialties", limit: 65535
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["category_id"], name: "index_ideas_on_category_id", using: :btree
    t.index ["hacker_id"], name: "index_ideas_on_hacker_id", using: :btree
  end

  add_foreign_key "collaboration_projects", "hackathons"
  add_foreign_key "collaboration_projects", "ideas"
  add_foreign_key "collaborations", "hackers"
  add_foreign_key "collaborations", "ideas"
  add_foreign_key "ideas", "categories"
  add_foreign_key "ideas", "hackers"
end
