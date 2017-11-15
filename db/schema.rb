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

ActiveRecord::Schema.define(version: 20171115221212) do

  create_table "date_cards", force: :cascade do |t|
    t.integer "user_id"
    t.integer "recipe_id"
    t.integer "drink_id"
    t.string  "playlist_id"
  end

  create_table "drinks", force: :cascade do |t|
    t.string "name"
    t.string "instructions"
    t.string "ingredients"
    t.string "liquor"
  end

  create_table "playlist_date_cards", force: :cascade do |t|
    t.integer "song_id"
    t.integer "date_card_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.string "ingredients"
    t.string "cuisine"
  end

  create_table "songs", force: :cascade do |t|
    t.string "title"
    t.string "artist"
    t.string "genre"
    t.string "song_link"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "date_name"
  end

end
