class LeaderboardController < ApplicationController

  def index
    @sorted_scores = Score.all.sort{|a,b| b[:score] <=> a[:score]}
  end

end
