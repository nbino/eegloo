class CreateVisuals < ActiveRecord::Migration
  def self.up
    create_table :visuals do |t|
      t.integer :listing_id
      t.integer :parent_id, :size, :width, :height
      t.string :type, :content_type, :filename, :thumbnail, :comment
      
      t.timestamps
    end
  end

  def self.down
    drop_table :visuals
  end
end
