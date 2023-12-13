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

ActiveRecord::Schema[7.1].define(version: 2023_12_12_123602) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comment", force: :cascade do |t|
    t.integer "user_id"
    t.integer "post_id"
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_comment_on_post_id"
    t.index ["user_id"], name: "index_comment_on_user_id"
  end

  create_table "like", force: :cascade do |t|
    t.integer "user_id"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_like_on_post_id"
    t.index ["user_id"], name: "index_like_on_user_id"
  end

  create_table "post", force: :cascade do |t|
    t.bigint "author_id"
    t.string "title"
    t.text "text"
    t.integer "likes_counter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_post_on_author_id"
    t.index ["likes_counter"], name: "index_post_on_likes_counter"
  end

  create_table "user", force: :cascade do |t|
    t.string "name"
    t.text "photo"
    t.text "bio"
    t.integer "posts_counter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["posts_counter"], name: "index_user_on_posts_counter"
  end

  add_foreign_key "comment", "post"
  add_foreign_key "comment", "user"
  add_foreign_key "like", "post"
  add_foreign_key "like", "user"
  add_foreign_key "post", "user", column: "author_id"
end
