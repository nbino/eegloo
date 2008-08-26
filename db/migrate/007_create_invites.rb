class CreateInvites < ActiveRecord::Migration
  def self.up
    create_table :invites do |t|
      t.belongs_to :user, :listing, :null => false
      t.string :email, :user_nick_name, :note
      
      t.timestamps
    end
  end

  def self.down
    drop_table :invites
  end
end
