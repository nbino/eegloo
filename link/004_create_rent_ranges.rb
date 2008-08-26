class CreateRentRanges < ActiveRecord::Migration
  def self.up
    create_table :rent_ranges do |t|
      t.string :name
      t.integer :lbound, :ubound
      t.timestamps
    end
    RentRange.create (:name=>"$500 - $650", :lbound=>500, :ubound=>650)
    RentRange.create (:name=>"$650 - $800", :lbound=>650, :ubound=>800)
    RentRange.create (:name=>"$800 - $1000", :lbound=>800, :ubound=>1000)
    RentRange.create (:name=>"$1000 - $1200", :lbound=>1000, :ubound=>1200)
    RentRange.create (:name=>"$1200 - $1400", :lbound=>1200, :ubound=>1400)
    RentRange.create (:name=>"$1400 - $1600", :lbound=>1400, :ubound=>1600)
    RentRange.create (:name=>"$1600 - $1800", :lbound=>1600, :ubound=>1800)
    RentRange.create (:name=>"$1800 - $2000", :lbound=>1800, :ubound=>2000)
    RentRange.create (:name=>"$2000 - $2250", :lbound=>2000, :ubound=>2250)
    RentRange.create (:name=>"$2250 - $2500", :lbound=>2250, :ubound=>2500)
    RentRange.create (:name=>"$2500 - $3000", :lbound=>2500, :ubound=>3000)
    RentRange.create (:name=>"$3000 - $3500", :lbound=>3000, :ubound=>3500)
    RentRange.create (:name=>"$3500 - $4000", :lbound=>3500, :ubound=>4000)
    RentRange.create (:name=>"$4000 - $4500", :lbound=>4000, :ubound=>4500)
    RentRange.create (:name=>"$4500 - $5000", :lbound=>4500, :ubound=>5000)
  end

  def self.down
    drop_table :rent_ranges
  end
end


      