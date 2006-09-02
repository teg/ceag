class VedleggController < ApplicationController

  before_filter :login_required, :only => [:opprett, :rediger, :legg_til, :slett]

  def last_ned
    @attachment = Attachment.find(params[:id])
    send_file @attachment.path_to_file, :stream => true, 
                                   :disposition => 'attachment', 
                                   :type => @attachment.mime_type
  end

  def opprett
    news = News.find_by_id(params[:nyhet])
    attachment = Attachment.new(params[:attachment])
    news.attachments << attachment
    flash[:notice] = "'#{attachment.name}' har blitt vedlagt saken '#{news.title}'."
    redirect_to :action => 'legg_til', :nyhet => news.id
  end
  
  def list
    @attachments = Attachments.find :all
  end

  def legg_til
    @news = News.find_by_id(params[:nyhet])
  end
  
  def rediger
    @attachment = Attachment.find(params[:id])
    @news = @attachment.news
  end
  
  
  def slett
    if Attachment.find(params[:id]).destroy
      flash[:notice] = "Vedlegget har blitt slettet."
    else  
      flash[:warning] = "Klarte ikke å slette assosiert fil."
    end 
    redirect_to :controller => 'nyheter'
  end

end