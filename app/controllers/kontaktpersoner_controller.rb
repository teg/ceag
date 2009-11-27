#encoding: utf-8
class KontaktpersonerController < ApplicationController

  def index
    list
    render :action => 'list'
  end

  def list
    @contacts = Contact.find :all
  end
end
