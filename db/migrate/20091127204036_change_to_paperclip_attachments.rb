class ChangeToPaperclipAttachments < ActiveRecord::Migration
  def self.up
    Attachment.delete_all
    remove_column :attachments, :filename
    remove_column :attachments, :mime_type
    add_column :attachments, :document_file_name,    :string
    add_column :attachments, :document_content_type, :string
    add_column :attachments, :document_file_size,    :integer
    add_column :attachments, :document_updated_at,   :datetime
  end

  def self.down
    raise IrreversibleMigration
  end
end
