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

ActiveRecord::Schema.define(:version => 20111201234330) do

  create_table "ingredients", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipes", :force => true do |t|
    t.string   "name"
    t.integer  "cook_time"
    t.integer  "prep_time"
    t.text     "description"
    t.text     "steps"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
  end

  create_table "recipes_tags", :id => false, :force => true do |t|
    t.integer "recipe_id"
    t.integer "tag_id"
  end

  create_table "recipes_users", :id => false, :force => true do |t|
    t.integer "recipe_id"
    t.integer "user_id"
  end

  create_table "supplies", :force => true do |t|
    t.decimal  "amount"
    t.string   "unit"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ingredient_id"
    t.integer  "recipe_id"
  end

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "units", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "username"
    t.string   "crypted_password"
    t.string   "salt"
  end

end
