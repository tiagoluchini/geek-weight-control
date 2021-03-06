# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'a282daa8be7c118319acb91709bf1597'

  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
  # If you want "remember me" functionality, add this before_filter to Application Controller
  # before_filter :login_from_cookie
  
  before_filter :authenticate, :except => [:user_logout, :user_signup]
  
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
