class CreateFlags < ActiveRecord::Migration
  def self.up
    create_table :flags do |t|
      t.belongs_to :listing, :user, :null => false
      t.string :type, :attr_name, :comment
      t.timestamps
    end
  end

  def self.down
    drop_table :flags
  end
end
