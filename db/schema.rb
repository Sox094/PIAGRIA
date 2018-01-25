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

ActiveRecord::Schema.define(version: 20180124211943) do

  create_table "answers", force: :cascade do |t|
    t.integer  "question_id"
    t.string   "content"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "formulaire_id"
  end

  add_index "answers", ["formulaire_id"], name: "index_answers_on_formulaire_id"

  create_table "chart_tests", force: :cascade do |t|
    t.integer  "formulaire_id"
    t.integer  "question_id"
    t.integer  "answer_id"
    t.string   "nom"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "forms", force: :cascade do |t|
    t.string   "nom"
    t.string   "description"
    t.date     "datedecreation"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "forms", ["user_id"], name: "index_forms_on_user_id"

  create_table "formulaires", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  add_index "formulaires", ["user_id"], name: "index_formulaires_on_user_id"

  create_table "photos", force: :cascade do |t|
    t.integer  "question_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "photos", ["question_id"], name: "index_photos_on_question_id"

  create_table "polls", force: :cascade do |t|
    t.integer  "formulaire_id"
    t.integer  "question_id"
    t.integer  "answer_id"
    t.string   "nom"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "polls", ["answer_id"], name: "index_polls_on_answer_id"
  add_index "polls", ["formulaire_id"], name: "index_polls_on_formulaire_id"
  add_index "polls", ["question_id"], name: "index_polls_on_question_id"

  create_table "questions", force: :cascade do |t|
    t.integer  "formulaire_id"
    t.string   "nom"
    t.integer  "typequestion"
    t.string   "media"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "user_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "questions", ["formulaire_id"], name: "index_questions_on_formulaire_id"
  add_index "questions", ["user_id"], name: "index_questions_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "nom"
    t.string   "prenom"
    t.string   "entreprise"
    t.string   "fonction"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
