class CreateAttachments < ActiveRecord::Migration
  def self.up
    create_table :attachments do |t|
      t.column :name, :string
      t.column :description, :string
      t.column :created_at, :datetime
      t.column :updated_at, :datetime
      t.column :mime_type, :string
      t.column :filename, :string
      t.column :news_id, :integer
    end
  end

  def self.down
    drop_table :attachments
  end
end
