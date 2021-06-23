# frozen_string_literal: true

require 'swagger_helper'

describe 'Scores' do

  path '/api/v1/scores' do

    get 'Lists all scores' do
      tags 'Score'
      consumes 'application/json'

      response '200', 'scores retrieved' do
        run_test!
      end
    end

    post 'Creates a score for a player' do
      tags 'Score'
      consumes 'application/json'
      parameter name: :score, in: :body, schema: {
        type: :object,
        properties: {
          player_id: 
          {
            type: :integer,
            description: 'The player id'
          },
          points:
          {
            type: :integer,
            minimum: 0,
            maximum: 100,
            description: 'The score; integer between 0 and 100'
          },
          start_time:
          {
            type: :string,
            format: :date_time,
            description: 'Starting date in format: yy-mm-ddThh:mm:ss (e.g. 2021-06-22T20:00:00)'
          },
          playing_time:
          {
            type: :number,
            format: :float,
            description: 'The time spent in minutes' }
        },
        required: %w(player_id points start_time playing_time)
      }

      response '200', 'score created' do
        let(:player) { { name: 'Erikson'} }
        let(:score) { { player_id: player.id, points: 10, start_time: DateTime.now, playing_time: 5 } }
        run_test!
      end

      response '400', 'invalid request' do
        let(:score) { { points: nil, start_time: '', playing_time: 1 } }
        run_test!
      end
    end
  end

  # NOT WORKING YET! TODO: bug fix params
  path '/api/v1/scores/weekly_summary' do
    post 'Weekly summary' do
      tags 'Score'
      consumes 'application/json'
      parameter name: :week_number, in: :body, type: :integer, maximum: 52
      parameter name: :stat_option,
                  in: :body,
                  type: :string,
                  description: 'Choose the result wanted; single_points, total_points, single_playing_time, or total_playing_time',

      required: ['week_number', 'stat_option']

      response '200', 'weekly summary top list' do
        run_test!
      end
    end
  end
end
