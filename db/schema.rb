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

ActiveRecord::Schema.define(version: 20160826175231) do

  create_table "animals", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "sci_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "animal_group"
    t.index ["animal_group"], name: "index_animals_on_animal_group", using: :btree
    t.index ["name"], name: "index_animals_on_name", using: :btree
  end

  create_table "identifications", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "photo_id"
    t.integer  "user_identification"
    t.boolean  "correct_identification"
    t.integer  "user_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["photo_id"], name: "index_identifications_on_photo_id", using: :btree
    t.index ["user_id"], name: "index_identifications_on_user_id", using: :btree
  end

  create_table "photos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "animal_id"
    t.integer  "project_id"
    t.index ["animal_id"], name: "index_photos_on_animal_id", using: :btree
    t.index ["project_id"], name: "index_photos_on_project_id", using: :btree
  end

  create_table "projects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_projects_on_name", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
