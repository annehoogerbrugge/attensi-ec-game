# frozen_string_literal: true

class Score < ApplicationRecord
  belongs_to :player

  validates :start_time, :playing_time, presence: true
end
