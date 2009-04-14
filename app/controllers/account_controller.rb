class AccountController < ApplicationController

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
  puts "\nparams: " + params.inspect
  puts "\n\nrubyamf_params: " + rubyamf_params.inspect
    return unless request.post?
    self.current_user = User.authenticate(params[:login], params[:password])
    if logged_in?
      if params[:remember_me] == "1"
        self.current_user.remember_me
        cookies[:auth_token] = { :value => self.current_user.remember_token , :expires => self.current_user.remember_token_expires_at }
      end
#      redirect_back_or_default(:controller => '/account', :action => 'index')
#      flash[:notice] = "Logged in successfully"
      render :amf => self.current_user
    else
      #render :amf => FaultObject.new("Invalid login/password!") unless logged_in?
      s = "Resultado: " + rubyamf_params[0] + " - " + params[0] + " - " + params[:login]
      render :amf => s
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
  
  def return_first
    @user = User.find(:first)
    render :amf => @user
  end
  
  def logout
    self.current_user.forget_me if logged_in?
    cookies.delete :auth_token
    reset_session
    flash[:notice] = "You have been logged out."
    redirect_back_or_default(:controller => '/account', :action => 'index')
  end
end
