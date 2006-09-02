class NyheterController < ApplicationController

  before_filter :login_required, :only => [:opprett, :rediger, :oppdater, :slett]
  verify :method => :post, :only => [ :opprett, :oppdater, :slett ],
         :redirect_to => { :action => :list }
         
  def index
    list
    render :action => 'list'
  end
  
  def list
    @news = News.find :all, :limit => 5, :order => 'created_at DESC'
  end
  
  def vis
    @news = News.find(params[:id])
    render :partial => 'news', :layout => true, :locals => { :news => @news}
  end
  
  def ny
    @news = News.new
  end
  
  def opprett
    @news = News.new(params[:news])
    if request.post? && @news.save
      flash[:notice] = "Nyheten '#{@news.title}' har blitt opprettet."
      redirect_to :controller => 'vedlegg', :action => 'legg_til', :nyhet => @news
    else
      return render(:action => 'ny')
    end
  end
  
  def rediger
    @news = News.find(params[:id])
  end
  
  def oppdater
    @news = News.find(params[:id])
    if @news.update_attributes(params[:news])
      flash[:notice] = "Saken '#{@news.title}' har blitt oppdatert."
      redirect_to :action => 'vis', :id => @news
    else
      render :action => 'rediger'
    end
  end
  
  def slett
    News.find(params[:id]).destroy
    flash[:notice] = "Saken har blitt slettet."
    redirect_to :action => 'list'
  end
  
end