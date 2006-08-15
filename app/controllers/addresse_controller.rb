class AddresseController < ApplicationController
  def index
    render :action => 'list'
  end
  
  def vis_kart
    @show_map = true;
    render :action => 'list'
  end
end
