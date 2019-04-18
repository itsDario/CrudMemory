# frozen_string_literal: true

class ApplicationController < ActionController::Base

  def home;
    unless session[:user_id].nil?
      set_user
    end
  end

   def test_user
     @user.nil?
   end

  def set_user
    @user = User.find(session[:user_id])
  end

  def authenticate
    byebug
    unless test_user
      byebug
    @user && BCrypt::Password.new(@user.password_digest) == params[:password]
      session[:user_id] = @user.id
    else
      byebug
      false
    end
  end

  # def flash_errors
  #       flash[:notice] = @user.errors.full_messages
  # end

  #   def check_if_logged_in
  #   unless session[:user_id].exists?
  #     redirect_to '/'
  #   end
  # end
end
