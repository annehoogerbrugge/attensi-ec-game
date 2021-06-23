# frozen_string_literal: true

class ScoreSerializer
  include JSONAPI::Serializer

  attribute :start_time, :points, :playing_time

  belongs_to :player
end
