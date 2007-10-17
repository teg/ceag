class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.column :name,:string
      t.column :mail,:string
    end
  end

  def self.down
    drop_table :contacts
  end
end
