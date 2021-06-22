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

  private

  def player_params
    params.require(:player).permit(:name)
  end
end
