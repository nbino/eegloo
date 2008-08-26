# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 15) do

  create_table "apt_types", :force => true do |t|
    t.string   "name"
    t.integer  "bedrooms"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "attr_values", :force => true do |t|
    t.string   "name"
    t.string   "type"
    t.integer  "acc",        :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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

  create_table "invites", :force => true do |t|
    t.string   "email"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "listing_infos", :force => true do |t|
    t.integer  "listing_id"
    t.integer  "sq_footage"
    t.integer  "ceiling_height"
    t.integer  "bathroom_n_id"
    t.integer  "floor_type_id"
    t.integer  "heat_q_id"
    t.integer  "ac_type_id"
    t.integer  "roof_access_type_id"
    t.integer  "back_yard_type_id"
    t.integer  "street_noise_level_id"
    t.integer  "nbors_noise_level_id"
    t.integer  "maintenance_q_id"
    t.integer  "appliances_q_id"
    t.integer  "bathroom_q_id"
    t.integer  "cellphone_q_id"
    t.integer  "cellphone_provider_id"
    t.string   "landlord_phone_number"
    t.string   "broker_phone_number"
    t.string   "comment"
    t.boolean  "broker_only"
    t.boolean  "elevator"
    t.boolean  "multi_level"
    t.boolean  "penthouse"
    t.boolean  "private_entrance"
    t.boolean  "gym"
    t.boolean  "laundry"
    t.boolean  "roaches"
    t.boolean  "rodents"
    t.boolean  "ants"
    t.boolean  "broadband"
    t.boolean  "doorman"
    t.boolean  "rent_stabilized"
    t.boolean  "rent_controlled"
    t.boolean  "convertable"
    t.boolean  "separate_kitchen"
    t.boolean  "balcony"
    t.boolean  "patio"
    t.boolean  "loft"
    t.boolean  "dogs_allowed"
    t.boolean  "cats_allowed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "listings", :force => true do |t|
    t.integer  "user_id",                               :null => false
    t.string   "address"
    t.string   "cross_street"
    t.float    "latitude"
    t.float    "longtitude"
    t.integer  "apt_type_id"
    t.integer  "nhood_id"
    t.integer  "rent_range_id"
    t.integer  "bogus_flag_count",       :default => 0
    t.integer  "broker_flag_count",      :default => 0
    t.integer  "na_flag_count",          :default => 0
    t.integer  "favorites_count",        :default => 0
    t.integer  "listing_comments_count", :default => 0
    t.datetime "avail_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "readings", :force => true do |t|
    t.integer "user_id"
    t.integer "listing_id"
  end

  create_table "rent_ranges", :force => true do |t|
    t.string   "name"
    t.integer  "lbound"
    t.integer  "ubound"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rooms", :force => true do |t|
    t.string   "type"
    t.integer  "listing_info_id"
    t.integer  "light_level_id"
    t.integer  "window_direction_id"
    t.integer  "length"
    t.integer  "width"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username",                                :default => "",   :null => false
    t.string   "email",                                   :default => "",   :null => false
    t.string   "password",                                :default => "",   :null => false
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.string   "remember_token"
    t.string   "activation_code",           :limit => 40
    t.string   "password_reset_code",       :limit => 40
    t.datetime "remember_token_expires_at"
    t.datetime "activated_at"
    t.boolean  "enabled",                                 :default => true
    t.boolean  "admin",                                   :default => true
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
