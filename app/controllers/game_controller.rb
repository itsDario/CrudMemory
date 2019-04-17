# frozen_string_literal: true

class GameController < ApplicationController
  before_action :check_if_logged_in
  
  def index
    # gamecode
    # byebug
  end

  def new
    # serve new page
  end

  def create
    if params[:difficulty] == 'easy'
      session['grid_size'] = 3
    elsif params[:difficulty] == 'medium'
      session['grid_size'] = 4
    elsif params[:difficulty] == 'hard'
      session['grid_size'] = 5
    end
    redirect_to '/learn'
  end

  def display_grid # display the boxes in the grid
    @gridNums = []
    @gridSize = session['grid_size']
    (@gridSize * @gridSize).times { @gridNums << rand(2) }
    session['gridNums'] = @gridNums
  end

  def input_grid # display empty grid to be filled by user
    @gridNums = session['gridNums']
  end

  def recall_submit # checked the submitted grid against the original
    guess = params[:game][:guess].map(&:to_i) # convert to numbers
    guess = fixGuess(guess) # fix form issue with extra 0s
    gridNums = session['gridNums'] # returns original generated grid

    if guess == gridNums # fowards them back to the display grid
      session['grid_size'] = session['grid_size'] += 1
      redirect_to '/learn'
      byebug
    else # foward them to the lose screen
      # Score.create(user_id: this, #leaderboard, score: session['gridSize'])
      redirect_to '/loseScreen'
      byebug
    end
  end

  def lose_screen # if guessed incorrectly tell them their score
    @score = session['grid_size']**2
  end

  def fixGuess(theGuess) # needed cause weird form issues
    answer = []
    theGuess.each_with_index do |_num, i|
      answer << theGuess[i] if theGuess[i + 1] != 1
    end
    answer
  end
end
