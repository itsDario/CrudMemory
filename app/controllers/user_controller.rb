# frozen_string_literal: true

class UserController < ApplicationController
  # def username; end
  #
  # def password_digest; end

  def new
    new_user
  end

  def create
    new_user_with_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      # flash_errors
      render 'new'
    end
  end

  def show
    @user = User.find(session[:user_id])
  end


  def edit
    set_user
  end

  def update
    set_user
    if authenticate && @user.update(params.require(:user).permit(:username))
      flash[:notice] = 'You have successfully updated your account!'
      redirect_to'/'
    else
      # flash_errors
      render'edit'
  end
  end

  def destroy
    @user.destory
    flash[:notice] = 'You have deleted your account'
    render '/'
  end

  private

  def strong_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

  def new_user
    @user = User.new
  end

  def new_user_with_params
    @user = User.new(strong_params)
  end

end
