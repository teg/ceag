class CreatePhoneNumbers < ActiveRecord::Migration
  def self.up
    create_table :phone_numbers do |t|
      t.column :number,:integer
      t.column :contact_id,:integer
    end
  end

  def self.down
    drop_table :phone_numbers
  end
end
