class CreateContactInfos < ActiveRecord::Migration
  def self.up
    create_table :contact_infos do |t|
      t.belongs_to :listing
      
      t.string :type, 
        :work_phone1, 
        :work_phone2, 
        :work_phone3, 
        :cell_phone1, 
        :cell_phone2, 
        :cell_phone3, 
        :fax1, 
        :fax2, 
        :fax3,
        :address1,
        :address2
        
      t.boolean :verified, :deals_direct
      
      t.integer :representing_broker_id
      
      t.timestamps
    end

    

  end



  def self.down
    drop_table :contact_infos
  end
end
