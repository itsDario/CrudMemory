# frozen_string_literal: true

class CreateLeaderboards < ActiveRecord::Migration[5.2]
  def change
    create_table :leaderboards do |t|
      t.string :difficulty

      t.timestamps
    end
  end
end
