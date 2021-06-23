# frozen_string_literal: true

class Api::V1::ScoresController < ApplicationController
  def index
    @scores = Score.all
    render json: ScoreSerializer.new(@scores).serializable_hash.to_json
  end

  def create
    @score = Score.create(score_params)
    render json: ScoreSerializer.new(@score).serializable_hash.to_json
  end

  def weekly_summary
    if %w(single_points total_points single_playing_time total_playing_time).include? params[:stat_option]
      @top_scores = WeeklySummary.new(params[:week_number], params[:stat_option]).find_top_scores

      render json: @top_scores.to_json
    else
      render json: { message: 'not found' }, status: :unprocessable_entity
    end

  end

  private

  def permitted_params
    params.permit(:week_number, :stat_option)
  end

  def score_params
    params.require(:score).permit(:player_id, :start_time, :points, :playing_time)
  end
end
