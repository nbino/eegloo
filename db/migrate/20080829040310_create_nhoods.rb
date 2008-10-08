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
 
    %w(Chelsea
        Columbus\ Circle
        East\ Village
        Financial\ District
        Flatiron
        Gramercy/Flatiron
        Greenwich\ Village
        Harlem
        Hell's\ Kitchen
        Lincoln\ Center
        Lower\ East\ Side
        Meatpacking\ District
        Midtown\ East
        Midtown\ West
        Murray\ Hill
        NoHo
        NoLita
        Rockefeller\ Center
        SoHo
        Theater\ District
        Times\ Square
        TriBeCa
        Union\ Square
        Upper\ East Side
        Upper\ West Side
        West\ Village).each  do |name|
      Nhood.create :name=>name
    end

  end

  def self.down
    drop_table :nhoods
  end
end
