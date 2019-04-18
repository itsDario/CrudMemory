# frozen_string_literal: true

class LeaderboardController < ApplicationController
  def index
    @sorted_scores = Score.all.sort { |a, b| b[:score] <=> a[:score] }
    @max_positions = sorted_scores.length
    @max_positions = 10 if @max_positions > 10
    # byebug
  end
end
