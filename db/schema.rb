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

ActiveRecord::Schema.define(version: 2019_03_01_163320) do

  create_table "admins", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "name"
  end

  create_table "agents", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  create_table "bookings", force: :cascade do |t|
    t.integer "seats_booked"
    t.integer "tour_id"
    t.integer "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status"
    t.string "preference"
    t.index ["customer_id"], name: "index_bookings_on_customer_id"
    t.index ["tour_id"], name: "index_bookings_on_tour_id"
  end

  create_table "bookmarks", force: :cascade do |t|
    t.integer "tour_id"
    t.integer "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_bookmarks_on_customer_id"
    t.index ["tour_id"], name: "index_bookmarks_on_tour_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "subject"
    t.text "reviews"
    t.integer "tour_id"
    t.integer "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_reviews_on_customer_id"
    t.index ["tour_id"], name: "index_reviews_on_tour_id"
  end

  create_table "searches", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "itinerary"
    t.float "min_price"
    t.float "max_price"
    t.string "name"
    t.date "start_date_from"
    t.date "start_date_to"
    t.integer "seats"
  end

  create_table "tours", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.float "price"
    t.date "booking_deadline"
    t.date "start_date"
    t.date "end_date"
    t.string "start_location"
    t.text "itinerary"
    t.integer "seats"
    t.string "status"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "agent_id"
    t.string "country"
    t.string "state"
    t.index ["agent_id"], name: "index_tours_on_agent_id"
  end

end
