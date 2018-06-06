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

ActiveRecord::Schema.define(version: 20180431144821) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "groups", force: :cascade do |t|
    t.string "nombre"
    t.integer "sexo"
    t.integer "quota"
    t.integer "extended_quota"
    t.integer "initial_age"
    t.integer "maximun_age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "registrations", force: :cascade do |t|
    t.string "alumno_name"
    t.integer "alumno_age"
    t.date "alumno_birtday"
    t.integer "alumno_gender"
    t.integer "alumno_dni"
    t.string "alumno_address"
    t.string "alumno_telephone"
    t.string "alumno_email"
    t.string "alumno_school_name"
    t.integer "alumno_grade"
    t.string "alumno_school_address"
    t.string "alumno_school_phone"
    t.string "alumno_medical_insurance"
    t.string "alumno_trauma"
    t.string "alumno_surgery"
    t.boolean "alumno_illness_asthma"
    t.string "alumno_illness_allergy"
    t.boolean "alumno_illness_heart_failure"
    t.boolean "alumno_illness_diabetes"
    t.string "alumno_illness_other"
    t.boolean "alumno_medical_observation"
    t.boolean "alumno_doctor"
    t.boolean "alumno_know_swim"
    t.string "alumno_swim_school"
    t.string "alumno_swim_leave_reasons"
    t.string "how_know_us"
    t.string "parents_relation"
    t.string "father_name"
    t.integer "father_age"
    t.boolean "father_lives"
    t.boolean "father_visit"
    t.string "father_email"
    t.string "father_profession"
    t.string "father_work_phone"
    t.string "mother_name"
    t.integer "mother_age"
    t.boolean "mother_lives"
    t.boolean "mother_visit"
    t.string "mother_email"
    t.string "mother_profession"
    t.string "mother_work_phone"
    t.string "who_register"
    t.boolean "i_attest"
    t.integer "status", default: 1, null: false
    t.bigint "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_registrations_on_group_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nombre"
    t.integer "tipo", default: 2, null: false
    t.boolean "habilitado", default: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "registrations", "groups"
end
