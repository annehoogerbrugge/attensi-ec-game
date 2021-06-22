# frozen_string_literal: true

require 'swagger_helper'

describe 'Scores' do

  path '/api/v1/scores' do

    post 'Creates a score for a player' do
      tags 'Score'
      consumes 'application/json'
      parameter name: :score, in: :body, schema: {
        type: :object,
        properties: {
          player_id: {
            type: :integer,
            description: 'The player id'
          },
          points: {
            type: :integer,
            minimum: 0,
            maximum: 100,
            description: 'The score; integer between 0 and 100'
          },
          start_time: {
            type: :string,
            format: :date_time,
            description: 'Starting date in format: yy-mm-ddThh:mm:ss (e.g. 2021-06-22T20:00:00)'
          },
          playing_time: {
            type: :number,
            format: :float,
            description: 'The time spent in minutes' }
        },
        required: [ 'player_id', 'points', 'start_time', 'playing_time']
      }

      response '201', 'score created' do
        let(:player) { { name: 'Erikson'} }
        let(:score) { { player_id: player.id, points: 10, start_time: DateTime.now, playing_time: 5 } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:score) { { points: nil, start_time: '', playing_time: 1 } }
        run_test!
      end
    end

    get 'Lists all players' do
      tags 'Player'
      consumes 'application/json'

      response '200', 'players retrieved'

      response '400', 'players not found'
    end
  end
end
