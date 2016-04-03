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

ActiveRecord::Schema.define(version: 20160402180620) do

  create_table "artists", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "audio_book_audios", force: true do |t|
    t.string   "path"
    t.integer  "audio_book_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "audio_book_texts", force: true do |t|
    t.string   "path"
    t.integer  "audio_book_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "audio_books", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "audio_files", force: true do |t|
    t.string   "artist"
    t.string   "title"
    t.string   "album"
    t.string   "tracknum"
    t.string   "path"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "radio_stations", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "video_files", force: true do |t|
    t.string   "title"
    t.string   "subtitle_path"
    t.string   "video_path"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
