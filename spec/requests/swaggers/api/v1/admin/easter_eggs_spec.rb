require 'swagger_helper'

RSpec.describe 'Swaggers::Api::V1::Admin::EasterEggs', type: :request do
  let!(:admin) { create(:admin) }
  let(:token)  { Auth::JwtService.generate_token(payload: { admin_id: admin.id }) }
  let(:Authorization) { "Bearer #{token}" }

  path '/api/v1/admin/easter_eggs' do
    get 'receive list easter eggs' do
      tags 'Admin easter eggs'
      produces 'application/json'

      security [ bearerAuth: [] ]
      parameter name: :status, in: :query, type: :string, required: false
      parameter name: :hunter_email, in: :query, type: :string, required: false

      response '200', 'OK' do
        run_test!
      end
    end

    post 'create easter egg' do
      tags 'Admin easter eggs'
      produces 'application/json'
      consumes 'application/json'

      security [ bearerAuth: [] ]
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          latitude: { type: :number },
          longitude: { type: :number },
          clue: { type: :string }
        }
      }

      response '201', 'create' do
        let(:params) { { latitude: 50.45, longitude: 30.52, clue: 'test clue' } }

        run_test! do |response|
          body = JSON.parse(response.body)
          expect(body['clue']).to eq('test clue')
        end
      end
    end
  end

  path '/api/v1/admin/easter_eggs/{id}' do
    patch 'update easter eggs' do
      tags 'Admin easter eggs'
      produces 'application/json'

      security [ bearerAuth: [] ]
      parameter name: :id, in: :path, type: :string
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          latitude: { type: :number },
          longitude: { type: :number },
          clue: { type: :string }
        }
      }


      response '200', 'updated' do
        let!(:egg) { create(:easter_egg, clue: 'old') }
        let(:id) { egg.id }
        let(:params) { { clue: 'updated clue' } }

        run_test!
      end
    end
  end
end
