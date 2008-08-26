class CreateReadings < ActiveRecord::Migration
  def self.up
    create_table :readings do |t|
      t.references :user, :listing
    end
    
  end

  def self.down
    drop_table :readings
  end
end
