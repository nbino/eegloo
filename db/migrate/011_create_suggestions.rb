class CreateSuggestions < ActiveRecord::Migration
  def self_up
    create_table :suggestions do |t|
      t.belongs_to :friendship
      t.belongs_to :listing
      t.timestamps
    end
  end
  
  def self.down
    drop_table :suggestions
  end
end