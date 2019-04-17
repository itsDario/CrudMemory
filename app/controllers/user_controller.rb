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
      redirect_to 'application#home'
    else
      flash_errors
      render'new'
    end
  end

  def edit
    set_user
  end

  def update
      if @user.update(strong_params)
        flash[:notice] = "You have successfully updated your account!"
        render'application#home'
      else
        flash_errors
        render'edit'
    end
  end

  def destroy
    @user.destory
    flash[:notice] = "You have deleted your account"
    render 'application#home'
  end


private

  def strong_params
    params.require(:user).permit(:username,:password,:password_confirmation)
  end

  def new_user
    @user = User.new
  end

  def new_user_with_params
    @user = User.new(strong_params)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
