# frozen_string_literal: true

class Api::V1::PlayersController < ApplicationController
  def index
    @players = Player.all
    render json: PlayerSerializer.new(@players).serializable_hash.to_json
  end

  def create
    @player = Player.create(player_params)
    render json: PlayerSerializer.new(@player).serializable_hash.to_json
  end

  def impact_report
    playthroughts = ImpactReport.new.playthroughs
    total_playthroughs = playthroughts.sum { |p| p[:playthrough] }
    # total time played
    total_play_time = Score.sum(&:playing_time)
    render json: {
      total_play_time: total_play_time,
      total_playthroughs: total_playthroughs,
      playthroughs: playthroughts
    }.to_json
  end

  private

  def player_params
    params.require(:player).permit(:name)
  end
end
