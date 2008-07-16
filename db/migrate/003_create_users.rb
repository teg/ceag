class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table "users", :force => true do |t|
      t.column :login,                     :string
      t.column :email,                     :string
      t.column :crypted_password,          :string, :limit => 40
      t.column :salt,                      :string, :limit => 40
      t.column :created_at,                :datetime
      t.column :updated_at,                :datetime
      t.column :remember_token,            :string
      t.column :remember_token_expires_at, :datetime
    end
      
  #Dispatcher.reset_application!
      
      User.create(:id => "1",
                  :crypted_password => '38abf5e4d8d4733410414c328212ca8835d12f4b', 
                  :salt => 'd5b19a33c4bd7fb6d93fa82208182d86c2ea3231',
                  :login => "tel@jklm.no",
                  :email =>"tel@jklm.no",
                  :updated_at => Time.now,
                  :created_at => Time.now).save!
      User.create(:id => "2",
                  :crypted_password => 'ed7469e5c6eab480211192df17232e832301d4c4', 
                  :salt => '7db65733bd833fca7ec00273b9620bab36ee547f',
                  :login => "teg@jklm.no",
                  :email =>"teg@jklm.no",
                  :updated_at => Time.now,
                  :created_at => Time.now).save!
  end

  def self.down
    drop_table "users"
  end
end
