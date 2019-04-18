class ScoreController < ApplicationController

  def destroy
    Score.find(params[:value]).destroy
    redirect_to '/profile'
  end

end
