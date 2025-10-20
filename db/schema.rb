# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_10_19_133357) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"
  enable_extension "pgcrypto"
  enable_extension "uuid-ossp"

  create_table "analyses", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id", null: false
    t.string "title"
    t.integer "analysis_type"
    t.jsonb "parameters"
    t.integer "status"
    t.integer "credit_cost"
    t.jsonb "results"
    t.text "error_messages"
    t.datetime "started_at"
    t.datetime "completed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_analyses_on_user_id"
  end

  create_table "analysis_responses", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "analysis_id", null: false
    t.uuid "response_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["analysis_id"], name: "index_analysis_responses_on_analysis_id"
    t.index ["response_id"], name: "index_analysis_responses_on_response_id"
  end

  create_table "credit_transactions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id", null: false
    t.integer "amount"
    t.integer "transaction_type"
    t.string "reference_type"
    t.uuid "reference_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_credit_transactions_on_user_id"
  end

  create_table "reports", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "analysis_id", null: false
    t.string "title"
    t.integer "format"
    t.text "content"
    t.string "export_url"
    t.integer "version"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["analysis_id"], name: "index_reports_on_analysis_id"
  end

  create_table "responses", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "survey_id", null: false
    t.string "participant_id"
    t.jsonb "response_data"
    t.jsonb "demographic_data"
    t.integer "completion_status"
    t.datetime "started_at"
    t.datetime "completed_at"
    t.string "ip_address"
    t.string "device_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["survey_id"], name: "index_responses_on_survey_id"
  end

  create_table "scale_items", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "scale_id", null: false
    t.integer "item_number"
    t.text "item_text"
    t.string "item_type"
    t.jsonb "scoring_rules"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["scale_id"], name: "index_scale_items_on_scale_id"
  end

  create_table "scales", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "unique_identifier"
    t.string "title"
    t.text "description"
    t.string "version"
    t.string "language"
    t.string "author"
    t.integer "publication_year"
    t.integer "citation_count"
    t.integer "usage_count"
    t.string "category"
    t.jsonb "metadata"
    t.integer "status"
    t.uuid "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_scales_on_user_id"
  end

  create_table "survey_scales", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "survey_id", null: false
    t.uuid "scale_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["scale_id"], name: "index_survey_scales_on_scale_id"
    t.index ["survey_id"], name: "index_survey_scales_on_survey_id"
  end

  create_table "surveys", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id", null: false
    t.string "title"
    t.text "description"
    t.integer "distribution_mode"
    t.integer "status"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer "target_participants"
    t.integer "actual_participants"
    t.decimal "completion_rate"
    t.jsonb "settings"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_surveys_on_user_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
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
    t.string "name"
    t.integer "role", default: 0, null: false
    t.integer "credit_balance", default: 0, null: false
    t.string "organization"
    t.string "locale", default: "en"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role"], name: "index_users_on_role"
  end

  add_foreign_key "analyses", "users"
  add_foreign_key "analysis_responses", "analyses"
  add_foreign_key "analysis_responses", "responses"
  add_foreign_key "credit_transactions", "users"
  add_foreign_key "reports", "analyses"
  add_foreign_key "responses", "surveys"
  add_foreign_key "scale_items", "scales"
  add_foreign_key "scales", "users"
  add_foreign_key "survey_scales", "scales"
  add_foreign_key "survey_scales", "surveys"
  add_foreign_key "surveys", "users"
end
