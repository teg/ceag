class AddresseController < ApplicationController

  caches_page :index, :vis_kart
  
  def index
    render :action => 'list'
  end
  
  def vis_kart
    @show_map = true;
    @id = @params[:id]
    render :action => 'list'
  end
end
