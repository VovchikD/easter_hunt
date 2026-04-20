require 'swagger_helper'

RSpec.describe 'Swaggers::Api::V1::Hunter::EasterEggs', type: :request do
  let!(:hunter) { create(:hunter) }
  let(:token)  { Auth::JwtService.generate_token(payload: { hunter_id: hunter.id }) }
  let(:Authorization) { "Bearer #{token}" }

  path '/api/v1/hunter/easter_eggs/found' do
    get 'receive list of found eggs' do
      tags 'Hunter found easter eggs'
      produces 'application/json'

      security [ bearerAuth: [] ]

      response '200', 'OK' do
        run_test!
      end
    end
  end

  path '/api/v1/hunter/easter_eggs/not_found' do
    get 'receive list of not found eggs' do
      tags 'Hunter not found easter eggs'
      produces 'application/json'

      security [ bearerAuth: [] ]
      response '200', 'OK' do
        run_test!
      end
    end
  end

  path '/api/v1/hunter/easter_eggs/mark_found' do
    patch 'mark easter egg as found' do
      tags 'Hunter mark egg as found'
      produces 'application/json'

      security [ bearerAuth: [] ]
      parameter name: :code, in: :query, type: :string, required: true

      response '200', 'updated' do
        let!(:egg) { create(:easter_egg) }
        let(:code) { egg.code }

        run_test!
      end
    end
  end
end
