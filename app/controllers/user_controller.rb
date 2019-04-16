# frozen_string_literal: true

class UserController < ApplicationController
  def username; end

  def password_digest; end

  def new
    @new = User.new
  end
end
