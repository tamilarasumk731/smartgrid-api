# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_06_214356) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "product_id", null: false
    t.bigint "ryder_id", null: false
    t.bigint "retailer_id", null: false
    t.integer "status", null: false
    t.string "eta", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "route_info"
    t.index ["product_id"], name: "index_orders_on_product_id"
    t.index ["retailer_id"], name: "index_orders_on_retailer_id"
    t.index ["ryder_id"], name: "index_orders_on_ryder_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "retail_products", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "retailer_id", null: false
    t.boolean "availablity", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_retail_products_on_product_id"
    t.index ["retailer_id"], name: "index_retail_products_on_retailer_id"
  end

  create_table "retailers", force: :cascade do |t|
    t.string "name"
    t.float "retailer_lat"
    t.float "retailer_lng"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ryders", force: :cascade do |t|
    t.string "name"
    t.string "mobile"
    t.float "ryder_lat"
    t.float "ryder_lng"
    t.boolean "available"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_data", force: :cascade do |t|
    t.bigint "user_link_id", null: false
    t.string "site"
    t.string "current_url"
    t.string "from_url"
    t.string "lat"
    t.string "lng"
    t.float "duration", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "start_date"
    t.string "end_date"
    t.index ["user_link_id"], name: "index_user_data_on_user_link_id"
  end

  create_table "user_links", force: :cascade do |t|
    t.string "user_name"
    t.string "user_mail"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "mail"
    t.string "mobile"
    t.string "address"
    t.float "lat"
    t.float "lng"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
