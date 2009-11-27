#encoding: utf-8
class Attachment < ActiveRecord::Base
  belongs_to :news
  
  has_attached_file :document, 
    :storage => :s3, 
    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
    :path => ":attachment/:id/:style.:extension",
    :styles => { :illustration => "300x550>" }, 
    :whiny => false
  
  def to_norwegian
    "vedlegget"
  end
end
