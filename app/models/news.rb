#encoding: utf-8
class News < ActiveRecord::Base
  has_many :attachments, :dependent => :destroy
  
  validates_presence_of :title, :body, :message => 'kan ikke være blank'
  
  def illustration
    attachments.to_a.find{|attachment| attachment.image? }
  end

  def to_norwegian
    "nyheten"
  end
end
