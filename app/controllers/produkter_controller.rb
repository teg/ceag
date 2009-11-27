#encoding: utf-8
class ProdukterController < ApplicationController

  def index
    render :action => 'list'
  end
end
