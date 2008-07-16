require 'RMagick' 

class Attachment < ActiveRecord::Base
  belongs_to :news
  validates_presence_of :filename, :mime_type, :name, :message => 'kan ikke være blank'
  
  before_destroy :delete_files
  
  def file=(uploaded_file)
    @uploaded_file = uploaded_file
    unless uploaded_file.blank?
      self[:filename] = @uploaded_file.original_filename
      self[:mime_type] = @uploaded_file.content_type
    end
  end
    
  def after_save
    #if it's large enough to be a real file
    if @uploaded_file.instance_of?(Tempfile)
      return FileUtils.copy( @uploaded_file.local_path, path_to_file) 
    else
      return File.open(path_to_file, "wb") { |f| f.write(@uploaded_file.read) }
    end
    create_thumbnail! if image?
  end
  
  def create_thumbnail! 
    img = Magick::Image.read(path_to_file).first
    img.resize_to_fit!(300, 550)
    img.write(path_to_thumbnail){self.format = img.format}
  end
  
  def image?
    return false unless mime_type
    mime_type.starts_with? 'image'
  end
  
  # setup file location
  def path_to_file
    RAILS_ROOT + "/uploads/" + self.id.to_s
  end
  
  def path_to_thumbnail
    raise "Only images have thumbnails" unless image?
    path_to_file + '_thumbnail'
  end
  
  def delete_files
    File.delete(path_to_thumbnail) if File.exist?(path_to_thumbnail)
    puts File
    (File.exists?(path_to_file) && File.delete(path_to_file) == 1)
  end
  
  def to_norwegian
    "vedlegget"
  end
end
