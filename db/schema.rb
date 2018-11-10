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

ActiveRecord::Schema.define(version: 2018_11_10_064543) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blue_space_conversations", force: :cascade do |t|
    t.text "content"
    t.integer "category"
    t.integer "delay"
    t.integer "scene_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["scene_id"], name: "index_blue_space_conversations_on_scene_id"
  end

  create_table "blue_space_logs", force: :cascade do |t|
    t.integer "player_id"
    t.text "conversation_content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_blue_space_logs_on_player_id"
  end

  create_table "blue_space_scenes", force: :cascade do |t|
    t.string "name"
    t.integer "current_conversation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["current_conversation_id"], name: "index_blue_space_scenes_on_current_conversation_id"
  end

  create_table "blue_spaces", force: :cascade do |t|
    t.integer "player_id"
    t.integer "current_scene_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["current_scene_id"], name: "index_blue_spaces_on_current_scene_id"
    t.index ["player_id"], name: "index_blue_spaces_on_player_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "post_id"
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "post_tag_relations", force: :cascade do |t|
    t.integer "post_id"
    t.integer "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_post_tag_relations_on_post_id"
    t.index ["tag_id"], name: "index_post_tag_relations_on_tag_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "desc_img", limit: 255
    t.text "content"
    t.integer "user_id"
    t.integer "content_type", comment: "文件格式"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.text "avatar_url"
    t.text "html_url"
    t.integer "github_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["github_user_id"], name: "index_users_on_github_user_id"
  end

end
