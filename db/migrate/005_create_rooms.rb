class CreateRooms < ActiveRecord::Migration
  def self.up
    create_table :rooms do |t|
      t.string :type
      t.belongs_to :listing
      t.integer :light_level, :exposure, :windows_facing, :length, :width, :room_size, :bed_size
      t.boolean :windows
      
      t.timestamps
    end
  end

  def self.down
    drop_table :rooms
  end
end
