# frozen_string_literal: true

class Score < ApplicationRecord
  belongs_to :player

  validates :start_time, :playing_time, presence: true
  validates :points, numericality: { only_integer: true, less_than_or_equal_to: 100 }

  scope :high_score, ->(player) { where(player: player).maximum('points') }
  scope :ordered_on_points, -> { order(points: :desc) }
  scope :ordered_on_playing_time, -> { order(playing_time: :desc) }
end
