# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20080904172450) do

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "listing_id"
    t.string   "type"
    t.string   "content"
    t.integer  "rating",     :default => 0
    t.boolean  "private",    :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contact_infos", :force => true do |t|
    t.integer  "listing_id"
    t.string   "type"
    t.string   "work_phone1"
    t.string   "work_phone2"
    t.string   "work_phone3"
    t.string   "cell_phone1"
    t.string   "cell_phone2"
    t.string   "cell_phone3"
    t.string   "fax1"
    t.string   "fax2"
    t.string   "fax3"
    t.string   "address1"
    t.string   "address2"
    t.boolean  "verified"
    t.boolean  "deals_direct"
    t.integer  "representing_broker_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "favorites", :force => true do |t|
    t.integer  "listing_id", :null => false
    t.integer  "user_id",    :null => false
    t.string   "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "flags", :force => true do |t|
    t.integer  "listing_id", :null => false
    t.integer  "user_id",    :null => false
    t.string   "type"
    t.string   "attr_name"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendships", :force => true do |t|
    t.integer "friend2_id"
    t.integer "friend1_id"
  end

  create_table "invites", :force => true do |t|
    t.integer  "user_id",        :null => false
    t.integer  "listing_id",     :null => false
    t.string   "email"
    t.string   "user_nick_name"
    t.string   "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "listings", :force => true do |t|
    t.integer  "user_id",                               :null => false
    t.integer  "nhood_id"
    t.string   "address"
    t.string   "cross_street1"
    t.string   "cross_street2"
    t.float    "latitude"
    t.float    "longtitude"
    t.datetime "avail_date"
    t.integer  "apt_no"
    t.integer  "n_bedrooms"
    t.integer  "rent_range_top"
    t.integer  "rent_range_bottom"
    t.integer  "rent"
    t.integer  "sq_footage"
    t.integer  "n_bathrooms"
    t.integer  "bogus_flag_count",       :default => 0
    t.integer  "broker_flag_count",      :default => 0
    t.integer  "na_flag_count",          :default => 0
    t.integer  "favorites_count",        :default => 0
    t.integer  "listing_comments_count", :default => 0
    t.integer  "ceiling_height"
    t.integer  "floor_type"
    t.integer  "heat_q"
    t.integer  "private_back_yard"
    t.integer  "street_noise_level"
    t.integer  "nbors_noise_level"
    t.integer  "appliances_q"
    t.integer  "bathroom_q"
    t.integer  "cellphone_q"
    t.integer  "cellphone_provider"
    t.integer  "maintenance_q"
    t.boolean  "broker_only"
    t.boolean  "dogs_allowed"
    t.boolean  "cats_allowed"
    t.boolean  "multi_level"
    t.boolean  "penthouse"
    t.boolean  "private_entrance"
    t.boolean  "roaches"
    t.boolean  "rodents"
    t.boolean  "ants"
    t.boolean  "bedbugs"
    t.boolean  "rent_stabilized"
    t.boolean  "rent_controlled"
    t.boolean  "convertable"
    t.boolean  "separate_kitchen"
    t.boolean  "balcony"
    t.boolean  "central_ac"
    t.boolean  "patio"
    t.boolean  "loft"
    t.boolean  "elevator"
    t.boolean  "gym"
    t.boolean  "laundry"
    t.boolean  "broadband"
    t.boolean  "doorman"
    t.boolean  "roof_access"
    t.boolean  "common_back_yard"
    t.string   "tenant_comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nhoods", :force => true do |t|
    t.string   "name"
    t.integer  "safety_rating"
    t.integer  "schools_rating"
    t.integer  "parking_rating"
    t.integer  "night_life_rating"
    t.integer  "food_rating"
    t.integer  "services_rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "readings", :force => true do |t|
    t.integer "user_id"
    t.integer "listing_id"
  end

  create_table "rooms", :force => true do |t|
    t.string   "type"
    t.integer  "listing_id"
    t.integer  "light_level"
    t.integer  "exposure"
    t.integer  "windows_facing"
    t.integer  "length"
    t.integer  "width"
    t.integer  "room_size"
    t.integer  "bed_size"
    t.boolean  "windows"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username",                                                  :null => false
    t.string   "email",                                                     :null => false
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.string   "remember_token"
    t.string   "activation_code",           :limit => 40
    t.string   "password_reset_code",       :limit => 40
    t.integer  "access_bitmap",                           :default => 0
    t.datetime "remember_token_expires_at"
    t.datetime "activated_at"
    t.boolean  "enabled",                                 :default => true
    t.boolean  "admin",                                   :default => true
    t.boolean  "allow_contact",                           :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "visuals", :force => true do |t|
    t.integer  "listing_id"
    t.integer  "parent_id"
    t.integer  "size"
    t.integer  "width"
    t.integer  "height"
    t.string   "type"
    t.string   "content_type"
    t.string   "filename"
    t.string   "thumbnail"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
