class CreateNhoods < ActiveRecord::Migration
  def self.up
    create_table :nhoods do |t|
      t.string :name
      t.integer :safety_rating,
        :schools_rating,
        :parking_rating,
        :night_life_rating,
        :food_rating,
        :services_rating
        
      t.timestamps
    end
    
    AttributeLiterals::NHOODS.each  do |name|
      Nhood.create :name=>name
    end

  end

  def self.down
    drop_table :nhoods
  end
end
