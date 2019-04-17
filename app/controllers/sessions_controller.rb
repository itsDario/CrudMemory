class SessionsController < ApplicationController

  def new
  end

  def create
        @user = User.find_by(username: params[:username])
      # unless @user.username == nil || @user.username.empty?
      if  @user && BCrypt::Password.new(@user.password_digest) == params[:password]
        session[:user_id] = @user.id
        redirect_to '/'
      else
        render'new'
      end
    end

  def destroy
  session.destroy
  redirect_to '/'
  end

end
