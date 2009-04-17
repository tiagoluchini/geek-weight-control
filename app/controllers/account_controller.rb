class AccountController < ApplicationController

  before_filter :authenticate, :except => [:user_logout, :user_signup]

  def user_login
    render :amf => self.current_user
  end

  def user_signup
    @user = User.new(params[:user])
    return unless request.post?
    @user.save!
    self.current_user = @user
    redirect_back_or_default(:controller => '/account', :action => 'index')
    flash[:notice] = "Thanks for signing up!"
  rescue ActiveRecord::RecordInvalid
    render :action => 'signup'
  end
    
  def user_logout
    self.current_user.forget_me if logged_in?
    cookies.delete :auth_token
    reset_session
    render :amf => DefaultMessages.OK
  end
  
  protected
  
    def authenticate
      creds = self.credentials
      if creds[:username]
        self.current_user = User.authenticate(creds[:username], creds[:password])
      end
      if logged_in?
        return true
      else
        render :amf => WeightFaultObject.new(WeightFaultObject.INVALID_LOGIN)
        return false
      end
    end

end
