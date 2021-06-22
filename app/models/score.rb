# frozen_string_literal: true

class Score < ApplicationRecord
  belongs_to :player

  validates :start_time, :playing_time, presence: true
  validates :points, numericality: { only_integer: true, less_than_or_equal_to: 100 }

  scope :high_score, ->(player) { where(player: player).maximum(:points) }
end
