class VedleggController < ApplicationController

  before_filter :login_required, :only => [:opprett, :rediger, :legg_til, :slett]


  verify :method => :post, :only => [ :opprett, :oppdater, :slett ],
         :redirect_to => { :action => :list }

  def last_ned
    @attachment = Attachment.find(params[:id])
    send_file @attachment.path_to_file, :stream => true, 
                                   :disposition => 'attachment', 
                                   :type => @attachment.mime_type
  end

  def opprett
    @news = News.find_by_id(params[:nyhet])
    @attachment = Attachment.new(params[:attachment])
    if @news.attachments << @attachment
      flash[:notice] = "'#{@attachment.name}' har blitt vedlagt saken '#{@news.title}'."
      redirect_to :action => 'legg_til', :nyhet => @news.id
    else
      render :action => 'legg_til'
    end
  end
  
  def list
    @attachments = Attachments.find :all
  end

  def legg_til
    @attachment = Attachment.new
    @news = News.find_by_id(params[:nyhet])
  end
  
  def rediger
    @attachment = Attachment.find(params[:id])
  end
  
  def oppdater
    @attachment = Attachment.find(params[:id])
    if @attachment.update_attributes(params[:attachment])
      flash[:notice] = "Vedlegget '#{@attachment.name}' har blitt oppdatert."
      redirect_to :controller => 'nyheter', :action => 'vis', :id => @attachment.news
    else
      render :action => 'rediger'
    end
  end
  
  
  def slett
    if Attachment.find(params[:id]).destroy
      flash[:notice] = "Vedlegget har blitt slettet."
    else  
      flash[:fatal] = "Klarte ikke å slette assosiert fil."
    end 
    redirect_to :controller => 'nyheter'
  end

end