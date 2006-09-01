class VedleggController < ApplicationController

  def last_ned
    @attachment = Attachment.find(params[:id])
    send_file @attachment.path_to_file, :stream => true, 
                                   :disposition => 'attachment', 
                                   :type => @attachment.mime_type
  end

  def create
    news = News.find_by_id(params[:news])
    attachment = Attachment.new(params[:attachment])
    news.attachments << attachment
    redirect_to :controller => 'nyheter', :action => 'rediger'
  end
  
  def list
    @attachments = Attachments.find :all
  end

  def legg_til
    @news = News.find_by_id(params[:news])
  end
  
  def rediger
    @attachment = Attachment.find(params[:id])
    @news = @attachment.news
  end

end