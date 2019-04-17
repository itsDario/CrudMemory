# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  has_many :scores
  has_many :leaderboards
  validates :username, presence: true, uniqueness: true, length: { minimum: 1 }
end
