# frozen_string_literal: true

class LeaderboardController < ApplicationController
  def index
    @user = User.find(session['user_id'])
    @sorted_scores = Score.all.sort { |a, b| b[:score] <=> a[:score] }
  end
end
