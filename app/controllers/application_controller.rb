# frozen_string_literal: true

class ApplicationController < ActionController::Base


  def home
    set_user unless session[:user_id].nil?
  end

   def test_user
     @user.nil?
   end

  def set_user
    @user = User.find(session[:user_id])
  end

  def authenticate
    byebug
    unless test_userc
    @user && BCrypt::Password.new(@user.password_digest) == params[:password]
      session[:user_id] = @user.id
    else
      false
    end
  end

  def check_for_user
    if session[:user_id] == nil
      redirect_to '/'
    end
  end

end
