class CreateRooms < ActiveRecord::Migration
  def self.up
    create_table :rooms do |t|
      t.string :type
      t.belongs_to :listing
      t.integer :light_level_id, :exposure_id, :length, :width, :size_id
      
      t.timestamps
    end
  end

  def self.down
    drop_table :rooms
  end
end
