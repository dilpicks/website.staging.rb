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

ActiveRecord::Schema[7.0].define(version: 2022_11_28_021004) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "allowlisted_jwts", force: :cascade do |t|
    t.string "jti", null: false
    t.string "aud"
    t.datetime "exp", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["jti"], name: "index_allowlisted_jwts_on_jti", unique: true
    t.index ["user_id"], name: "index_allowlisted_jwts_on_user_id"
  end

  create_table "article_authors", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "article_id"
    t.bigint "author_id"
    t.index ["article_id", "author_id"], name: "index_article_authors_on_article_id_and_author_id", unique: true
    t.index ["article_id"], name: "index_article_authors_on_article_id"
    t.index ["author_id"], name: "index_article_authors_on_author_id"
  end

  create_table "article_types", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "kind", limit: 255, null: false
    t.string "slug"
    t.index ["kind"], name: "index_article_types_on_kind", unique: true
    t.index ["slug"], name: "index_article_types_on_slug", unique: true
  end

  create_table "articles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title", limit: 255, null: false
    t.text "link"
    t.string "source", limit: 255
    t.string "classes", default: [], array: true
    t.bigint "page_status_id", null: false
    t.string "slug"
    t.bigint "article_type_id", null: false
    t.datetime "published_at"
    t.boolean "featured", default: true, null: false
    t.text "summary"
    t.string "subtitle", limit: 255
    t.string "meta_title", limit: 255
    t.text "meta_description"
    t.text "location"
    t.index ["article_type_id"], name: "index_articles_on_article_type_id"
    t.index ["page_status_id"], name: "index_articles_on_page_status_id"
    t.index ["slug"], name: "index_articles_on_slug", unique: true
    t.index ["title"], name: "index_articles_on_title", unique: true
  end

  create_table "characteristic_groups", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.string "name", limit: 255, null: false
    t.string "title", limit: 255
    t.integer "order", default: 0, null: false
    t.boolean "shown", default: true, null: false
    t.index ["slug"], name: "index_characteristic_groups_on_slug", unique: true
  end

  create_table "characteristics", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.string "name", limit: 255, null: false
    t.string "title", limit: 255
    t.boolean "shown", default: true, null: false
    t.bigint "characteristic_group_id", null: false
    t.bigint "test_id", null: false
    t.integer "order", default: 0, null: false
    t.index ["characteristic_group_id"], name: "index_characteristics_on_characteristic_group_id"
    t.index ["slug"], name: "index_characteristics_on_slug", unique: true
    t.index ["test_id"], name: "index_characteristics_on_test_id"
  end

  create_table "copy_blocks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "contentable_type", null: false
    t.bigint "contentable_id", null: false
    t.boolean "active", default: true, null: false
    t.text "content"
    t.text "classes", default: [], array: true
    t.string "slug"
    t.index ["contentable_type", "contentable_id"], name: "index_copy_blocks_on_contentable"
    t.index ["slug"], name: "index_copy_blocks_on_slug", unique: true
  end

  create_table "events", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title", limit: 255, null: false
    t.string "classes", default: [], array: true
    t.datetime "occurred_at"
    t.bigint "event_id"
    t.string "slug"
    t.index ["event_id"], name: "index_events_on_event_id"
    t.index ["slug"], name: "index_events_on_slug", unique: true
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "images", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "src", null: false
    t.string "title", limit: 255
    t.string "alt", limit: 255
    t.integer "width"
    t.integer "height"
    t.text "classes", default: [], array: true
    t.string "imageable_type"
    t.bigint "imageable_id"
    t.string "slug"
    t.boolean "primary", default: false, null: false
    t.index ["imageable_type", "imageable_id"], name: "index_images_on_imageable"
    t.index ["primary", "imageable_id", "imageable_type"], name: "index_images_on_primary_and_imageable_id_and_imageable_type", unique: true, where: "(\"primary\" = true)"
    t.index ["slug"], name: "index_images_on_slug", unique: true
  end

  create_table "page_statuses", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", limit: 255, null: false
    t.string "slug"
    t.index ["slug"], name: "index_page_statuses_on_slug", unique: true
    t.index ["status"], name: "index_page_statuses_on_status", unique: true
  end

  create_table "pages", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", limit: 255, null: false
    t.string "title", limit: 255
  end

  create_table "people", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", limit: 255, null: false
    t.text "bio"
    t.string "slug"
    t.boolean "team_member", default: false, null: false
    t.boolean "featured", default: false, null: false
    t.string "title", limit: 255
    t.text "summary"
    t.text "link"
    t.index ["slug"], name: "index_people_on_slug", unique: true
  end

  create_table "tests", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.string "name", limit: 255, null: false
    t.string "title", limit: 255
    t.string "code", limit: 255, null: false
    t.text "cpt_codes", default: [], array: true
    t.boolean "shown", default: true, null: false
    t.boolean "available", default: true, null: false
    t.datetime "published_at"
    t.index ["slug"], name: "index_tests_on_slug", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "allowlisted_jwts", "users", on_delete: :cascade
  add_foreign_key "article_authors", "people", column: "author_id"
  add_foreign_key "articles", "article_types"
  add_foreign_key "articles", "page_statuses"
  add_foreign_key "characteristics", "characteristic_groups"
  add_foreign_key "characteristics", "tests"
  add_foreign_key "events", "events"
end
