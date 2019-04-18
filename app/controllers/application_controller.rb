# frozen_string_literal: true

class ApplicationController < ActionController::Base

  def home;
    if session[:user_id].exists?
      set_user
    end
  end

  def set_user
    @user = User.find(session[:user_id])
  end

  def authenticate
    @user && BCrypt::Password.new(@user.password_digest) == params[:password]
      session[:user_id] = @user.id
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
