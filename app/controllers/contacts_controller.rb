#encoding: utf-8
class ContactsController < ApplicationController

  def index
    list
    render :action => 'list'
  end

  def list
    @contacts = Contacts.find :all
  end
end
