class AccountController < ApplicationController

  before_filter :authenticate, :except => [:user_logout, :user_signup]

  def user_login
    render :amf => self.current_user
  end

  def user_signup
puts ">>> PARAMS: " + params.inspect
puts ">>> RUBYAMF_PARAMS: " + rubyamf_params.inspect
    @user = User.new(params[:user])
puts ">>> @USER: " + @user.inspect
    #return unless request.post?
    @user.save!
    self.current_user = @user
    render :amf => self.current_user
  rescue ActiveRecord::RecordInvalid
    #puts "ERROR: " + 
    render :amf => WeightFaultObject.new(WeightFaultObject.INCOMPLETE_DATA)
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
