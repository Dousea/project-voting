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

ActiveRecord::Schema.define(version: 2021_08_17_152015) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "candidate_attributes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "number", null: false
    t.text "vision", null: false
    t.text "mission", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_candidate_attributes_on_user_id", unique: true
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
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "sidn"
    t.bigint "vote_id"
    t.boolean "eligible", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["sidn"], name: "index_users_on_sidn", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
    t.index ["vote_id"], name: "index_users_on_vote_id"
  end

  create_table "votes", force: :cascade do |t|
    t.bigint "candidate_id", null: false
    t.bigint "constituent_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["candidate_id", "constituent_id"], name: "index_votes_on_candidate_id_and_constituent_id", unique: true
    t.index ["candidate_id"], name: "index_votes_on_candidate_id"
    t.index ["constituent_id"], name: "index_votes_on_constituent_id"
  end

  add_foreign_key "candidate_attributes", "users"
  add_foreign_key "votes", "users", column: "candidate_id"
  add_foreign_key "votes", "users", column: "constituent_id"
end
