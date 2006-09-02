class Attachment < ActiveRecord::Base
  belongs_to :news
  validates_presence_of :filename, :mime_type, :name
  
  before_destroy :delete_file
  
  def file=(uploaded_file)
    @uploaded_file = uploaded_file
    self[:filename] = @uploaded_file.original_filename
    self[:mime_type] = @uploaded_file.content_type
  end
    
  def after_save
    #if it's large enough to be a real file
    return FileUtils.copy( @uploaded_file.local_path, path_to_file) if @uploaded_file.instance_of?(Tempfile)
      else
    File.open(path_to_file, "wb") { |f| f.write(@uploaded_file.read) }
  end
  
  # setup file location
  def path_to_file
    RAILS_ROOT + "/uploads/" + self.id.to_s
  end
  
  def delete_file
    File.delete(path_to_file) == 1
  end
end
