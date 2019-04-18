# frozen_string_literal: true

class LeaderboardController < ApplicationController
  def index
    @user = User.find(session['user_id'])
    @sorted_scores = Score.all.sort { |a, b| b[:score] <=> a[:score] }
<<<<<<< HEAD
=======
    @max_positions = sorted_scores.length
    @max_positions = 10 if @max_positions > 10
    # byebug
>>>>>>> 0fd8a72bb7ecfdda7053f8a7532e56b5562fb59a
  end
end
