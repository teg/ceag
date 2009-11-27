#encoding: utf-8
class Contact < ActiveRecord::Base

  has_many :phone_numbers
  has_many :positions
end
