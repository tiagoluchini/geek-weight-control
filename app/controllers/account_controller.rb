class AccountController < ApplicationController

  before_filter :authenticate

  # say something nice, you goof!  something sweet.
  def index
    respond_to do |format|
      format.html { 
        redirect_to(:action => 'signup') unless logged_in? }
      format.amf { 
        render :amf => self.current_user if logged_in? 
        render :amf => FaultObject.new("Invalid login/password!") unless logged_in?
      }
    end
  end

  def login
    self.current_user = User.authenticate(params[:login], params[:password])
    if logged_in?
      render :amf => self.current_user
    else
      render :amf => FaultObject.new(WeightFaults.INVALID_LOGIN, "Invalid login")
    end
  end

  def signup
    @user = User.new(params[:user])
    return unless request.post?
    @user.save!
    self.current_user = @user
    redirect_back_or_default(:controller => '/account', :action => 'index')
    flash[:notice] = "Thanks for signing up!"
  rescue ActiveRecord::RecordInvalid
    render :action => 'signup'
  end
  
  def user
    render :amf => self.current_user
  end
  
  def logout
    self.current_user.forget_me if logged_in?
    cookies.delete :auth_token
    reset_session
    flash[:notice] = "You have been logged out."
    redirect_back_or_default(:controller => '/account', :action => 'index')
  end
  
  protected
  
    def authenticate
      creds = self.credentials
      if creds
        self.current_user = User.authenticate(creds[:username], creds[:password])
      end
      return logged_in?
    end

end
