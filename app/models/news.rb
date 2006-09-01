class News < ActiveRecord::Base
  has_many :attachments
end
