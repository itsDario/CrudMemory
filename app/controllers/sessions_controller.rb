class SessionsController < ApplicationController

  before_action :check_for_user, only: [:destroy]

  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && authenticate
      redirect_to'/'
      else
        render'new'
      flash[:notice] = "Username or Password is invalid"
    end
  end

  def destroy
  session.destroy
  redirect_to '/'
  end

end
