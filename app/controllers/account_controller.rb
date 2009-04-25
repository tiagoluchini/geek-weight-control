class AccountController < ApplicationController

  def user_login
    render :amf => self.current_user
  end

  def user_signup
    @user = User.new(params[:user])
    @user.save!
    self.current_user = @user
    render :amf => self.current_user
  rescue ActiveRecord::RecordInvalid
    render :amf => WeightFaultObject.new(WeightFaultObject.INCOMPLETE_DATA, @user.errors.to_a)
  end
    
  def user_logout
    self.current_user.forget_me if logged_in?
    cookies.delete :auth_token
    reset_session
    render :amf => DefaultMessages.OK
  end

end
