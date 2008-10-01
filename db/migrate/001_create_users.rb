class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :username, :email, :null => false
      t.string :crypted_password, :salt, :limit => 40
      t.string :remember_token
      t.string :activation_code, :password_reset_code, :limit => 40
      t.boolean :apt_info_access, :bld_info_access
      t.integer :access_bitmap, :default => 0
      t.datetime :remember_token_expires_at, :activated_at
      t.boolean :enabled, :admin, :allow_contact, :default => true 
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
