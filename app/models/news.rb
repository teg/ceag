class News < ActiveRecord::Base
  has_many :attachments, :dependent => :destroy
  
  validates_presence_of :title, :body, :message => 'kan ikke v�re blank'
  
  def to_norwegian
    "nyheten"
  end
end
