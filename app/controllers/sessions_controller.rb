class SessionsController < ApplicationController

  def new
  end

  def create
        @user = User.find_by(username: params[:username])
      # unless @user.username == nil || @user.username.empty?
      if  authenticate
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
