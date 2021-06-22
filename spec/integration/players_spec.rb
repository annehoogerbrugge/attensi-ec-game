# frozen_string_literal: true

require 'swagger_helper'

describe 'Players' do

  path '/api/v1/players' do

    get 'Lists all players' do
      tags 'Player'
      consumes 'application/json'

      response '200', 'players retrieved' do
        run_test!
      end
    end

    post 'Creates a player' do
      tags 'Player'
      consumes 'application/json'
      parameter name: :player, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string, required: true }
        }
      }

      response '200', 'player created' do
        let(:player) { { name: 'Messi' } }
        run_test!
      end

      response '400', 'invalid request' do
        let(:player) { { name: nil } }
        run_test!
      end
    end
  end
end
