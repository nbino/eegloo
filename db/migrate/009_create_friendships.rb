#moved to 015
class CreateFriendships < ActiveRecord::Migration
  def self.up
    create_table :friendships do |t|
      t.integer :friend2_id,  :friend1_id
    end
  end
  
  def self.down
    drop_table :friendships
  end
    
end