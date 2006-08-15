class ProdukterController < ApplicationController

  caches_page :index
  def index
    render :action => 'list'
  end
end
