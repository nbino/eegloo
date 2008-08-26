class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.belongs_to :user, :listing
      t.string :type
      t.string :content
      t.integer :rating, :default => 0
      t.boolean :private, :default => false
      t.timestamps
    end
        
  end

  def self.down
    drop_table :comments
  end
end
