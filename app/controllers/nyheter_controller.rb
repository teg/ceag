class NyheterController < ApplicationController

  def index
    list
    render :action => 'list'
  end
  
  def list
    @news = News.find :all, :limit => 5, :order => 'created_at DESC'
  end
  
  def vis
    @news = News.find(params[:id])
    @attachments = @news.attachments
  end
  
  def new
    @news = News.new
  end
  
  def create
    @news = News.new(params[:news])
    return render(:action => 'ny') unless (request.post? and @news.save!)
    flash[:notice] = "Nyhet lagt til"
    redirect_to :controller => 'vedlegg', :action => 'legg_til', :news => @news
  end
  
  def rediger
    @news = News.find(params[:id])
  end
  
  def update
    @news = News.find(params[:id])
    if @news.update_attributes(params[:car])
      flash[:notice] = 'Nyheten ble oppdatert'
      redirect_to :action => 'vis', :id => @news
    else
      render :action => 'rediger'
    end
  end
  
  def destroy
    News.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
  
end