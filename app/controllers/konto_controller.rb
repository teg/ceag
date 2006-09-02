class KontoController < ApplicationController
  def index
    return redirect_to(:action => 'logg_inn') unless logged_in?
    redirect_to(:controller => 'produkter')
  end

  def logg_inn
    return unless request.post?
    self.current_user = User.authenticate(params[:login], params[:password])
    if current_user
      if params[:remember_me] == "1"
        self.current_user.remember_me
        cookies[:auth_token] = { :value => self.current_user.remember_token , :expires => self.current_user.remember_token_expires_at }
      end
      redirect_back_or_default(:controller => 'produkter')
      flash[:notice] = "Du har blitt logget inn."
    end
    @login = params[:login]
    flash.now[:warning] = "Brukernavnet eller passordet var feil."
  end

  def ny
    @user = User.new(params[:user])
    return unless request.post?
    @user.save!
    self.current_user = @user
    redirect_back_or_default(:controller => 'produkter')
    flash[:notice] = "Brukeren #{user} har blitt opprettet."
  rescue ActiveRecord::RecordInvalid
    render :action => 'ny'
  end
  
  def logg_ut
    self.current_user.forget_me if logged_in?
    cookies.delete :auth_token
    self.current_user = nil
    flash[:notice] = "Du har blitt logget ut."
    redirect_to(:controller => 'produkter')
  end
end
