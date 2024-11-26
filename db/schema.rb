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

ActiveRecord::Schema.define(version: 2021_01_07_155217) do

  create_table "autor_comment_votes", force: :cascade do |t|
    t.integer "comment_id"
    t.integer "autor_id"
    t.boolean "positive"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["autor_id", "comment_id"], name: "index_autor_comment_votes_on_autor_id_and_comment_id", unique: true
    t.index ["autor_id"], name: "index_autor_comment_votes_on_autor_id"
    t.index ["comment_id"], name: "index_autor_comment_votes_on_comment_id"
  end

  create_table "autors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.datetime "birthday"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email"
    t.string "password"
    t.string "password_digest"
    t.string "avatar"
  end

  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.integer "status", default: 0
    t.integer "autor_id"
    t.integer "post_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "ancestry"
    t.index ["ancestry"], name: "index_comments_on_ancestry"
  end

  create_table "posts", force: :cascade do |t|
    t.string "name"
    t.string "title"
    t.text "content"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "views", default: 0
    t.string "avatar"
    t.integer "post_id"
    t.string "img"
    t.string "main_image"
    t.string "second_image"
    t.integer "autor_id"
    t.integer "comments_count"
  end

end
