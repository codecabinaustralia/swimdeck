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

ActiveRecord::Schema.define(version: 2018_11_01_085710) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "checklists", force: :cascade do |t|
    t.date "date_issued"
    t.integer "user_id"
    t.boolean "completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_checklists_on_user_id"
  end

  create_table "client_sites", force: :cascade do |t|
    t.integer "client_id"
    t.integer "site_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_client_sites_on_client_id"
    t.index ["site_id"], name: "index_client_sites_on_site_id"
  end

  create_table "client_students", force: :cascade do |t|
    t.integer "client_id"
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_client_students_on_client_id"
    t.index ["student_id"], name: "index_client_students_on_student_id"
  end

  create_table "clients", force: :cascade do |t|
    t.integer "user_id"
    t.string "first_name"
    t.string "last_name"
    t.string "phone_1"
    t.string "phone_2"
    t.string "address"
    t.string "address_city"
    t.string "address_state"
    t.string "address_postcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "get_to_know"
    t.index ["user_id"], name: "index_clients_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "post_id"
    t.integer "user_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "acknowleged"
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "competency_levels", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "color"
  end

  create_table "flags", force: :cascade do |t|
    t.string "title"
    t.integer "number_of_days"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "student_id"
    t.boolean "closed"
    t.text "note"
    t.boolean "compulsory_note"
    t.string "flag_type"
    t.index ["student_id"], name: "index_flags_on_student_id"
  end

  create_table "generic_checklist_statuses", force: :cascade do |t|
    t.integer "generic_check_list_id"
    t.integer "user_id"
    t.boolean "completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["generic_check_list_id"], name: "index_generic_checklist_statuses_on_generic_check_list_id"
    t.index ["user_id"], name: "index_generic_checklist_statuses_on_user_id"
  end

  create_table "generic_checklists", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "site_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "session_time"
    t.index ["site_id"], name: "index_generic_checklists_on_site_id"
  end

  create_table "generic_list_checks", force: :cascade do |t|
    t.integer "generic_checklist_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["generic_checklist_id"], name: "index_generic_list_checks_on_generic_checklist_id"
    t.index ["user_id"], name: "index_generic_list_checks_on_user_id"
  end

  create_table "lesson_participants", force: :cascade do |t|
    t.integer "lesson_id"
    t.integer "student_id"
    t.boolean "makeup_session"
    t.boolean "new_lesson"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "random_string"
    t.boolean "cancelled"
    t.index ["lesson_id"], name: "index_lesson_participants_on_lesson_id"
    t.index ["student_id"], name: "index_lesson_participants_on_student_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "finish_time"
    t.integer "user_id"
    t.integer "site_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "level_id"
    t.string "lesson_date"
    t.string "lesson_time"
    t.string "lesson_day"
    t.string "area"
    t.string "random_string"
    t.index ["level_id"], name: "index_lessons_on_level_id"
    t.index ["site_id"], name: "index_lessons_on_site_id"
    t.index ["user_id"], name: "index_lessons_on_user_id"
  end

  create_table "levels", force: :cascade do |t|
    t.string "title"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "links", force: :cascade do |t|
    t.string "StuSurname"
    t.string "StuGivenNames"
    t.string "StudId"
    t.string "LessonDay"
    t.string "LessonTime"
    t.string "LessonLevel"
    t.string "Area"
    t.string "TeachSurname"
    t.string "TeachGivenNames"
    t.string "StuBookStartDate"
    t.string "RPSurname"
    t.string "RPGivenNames"
    t.string "RPId"
    t.string "RPAddress"
    t.string "RPSuburb"
    t.string "RPPostCode"
    t.string "RPHomePhone"
    t.string "RPWorkPhone"
    t.string "RPPhone"
    t.string "RPEmail"
    t.string "RPBookingBalance"
    t.string "RPBookingFee"
    t.string "FamilyPaymentType"
    t.string "SpecialDiscount"
    t.string "RP"
    t.string "StuGender"
    t.string "StuDateOfBirth"
    t.string "StuAge"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.integer "student_id"
    t.integer "user_id"
    t.string "clients"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "actioned"
    t.boolean "note"
    t.boolean "note_closed"
    t.boolean "certificate"
    t.integer "level_id"
    t.integer "skill_id"
    t.boolean "sms"
    t.index ["level_id"], name: "index_posts_on_level_id"
    t.index ["skill_id"], name: "index_posts_on_skill_id"
    t.index ["student_id"], name: "index_posts_on_student_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "push_checklists", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "manager_id"
    t.integer "user_id"
    t.integer "site_id"
    t.date "date_issued"
    t.boolean "completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["site_id"], name: "index_push_checklists_on_site_id"
    t.index ["user_id"], name: "index_push_checklists_on_user_id"
  end

  create_table "sites", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string "title"
    t.integer "level_id"
    t.integer "rank_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["level_id"], name: "index_skills_on_level_id"
  end

  create_table "student_sites", force: :cascade do |t|
    t.integer "student_id"
    t.integer "site_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["site_id"], name: "index_student_sites_on_site_id"
    t.index ["student_id"], name: "index_student_sites_on_student_id"
  end

  create_table "student_skills", force: :cascade do |t|
    t.integer "student_id"
    t.integer "skill_id"
    t.integer "level_id"
    t.integer "competency_level_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["competency_level_id"], name: "index_student_skills_on_competency_level_id"
    t.index ["level_id"], name: "index_student_skills_on_level_id"
    t.index ["skill_id"], name: "index_student_skills_on_skill_id"
    t.index ["student_id"], name: "index_student_skills_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "dob"
    t.text "personal_notes"
    t.integer "current_level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "competent_but_waiting"
  end

  create_table "tasks", force: :cascade do |t|
    t.integer "user_id"
    t.integer "target_user"
    t.integer "student_id"
    t.string "title"
    t.date "due_date"
    t.boolean "completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "note"
    t.string "task_type"
    t.date "date_completed"
    t.index ["student_id"], name: "index_tasks_on_student_id"
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "user_sites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "site_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["site_id"], name: "index_user_sites_on_site_id"
    t.index ["user_id"], name: "index_user_sites_on_user_id"
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
    t.boolean "admin"
    t.boolean "manager"
    t.boolean "pool_deck_leader"
    t.boolean "teacher"
    t.boolean "customer_service"
    t.boolean "client"
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
