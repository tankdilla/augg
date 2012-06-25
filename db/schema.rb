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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120625200307) do

  create_table "feeds", :force => true do |t|
    t.string   "description"
    t.string   "uri"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "site_searches", :force => true do |t|
    t.integer  "site_id"
    t.datetime "search_run_on"
    t.integer  "number_of_results_requested"
    t.string   "results_params"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.string   "raw_results"
  end

  create_table "sites", :force => true do |t|
    t.string   "description"
    t.string   "url"
    t.string   "search_string"
    t.string   "parse_code"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end
