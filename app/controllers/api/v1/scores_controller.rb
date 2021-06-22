# frozen_string_literal: true

class Api::V1::ScoresController < ApplicationController
  def index
    @scores = Scores.all
    render json: ScoreSerializer.new(@scores).serializable_hash.to_json
  end

  def create
    @score = Score.create(score_params)
    render json: ScoreSerializer.new(@score).serializable_hash.to_json
  end

  private

  def score_params
    params.require(:score).permit(:player_id, :start_time, :points, :playing_time)
  end
end
