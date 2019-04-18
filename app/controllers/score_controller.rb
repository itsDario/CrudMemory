class ScoreController < ApplicationController

  before_action :check_for_user

  def destroy
    Score.find(params[:value]).destroy
    redirect_to '/profile'
  end


end
