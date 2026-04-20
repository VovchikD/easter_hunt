require 'swagger_helper'

RSpec.describe 'Swaggers::Api::V1::Hunter::Sessions', type: :request do
  path '/api/v1/hunter/login' do
    post 'Login hunter' do
      tags 'Hunter session'
      produces 'application/json'
      consumes 'application/json'

      parameter name: :params, in: :body, schema: {
        properties: {
          email: {
            type: :string
          },
          password: {
            type: :string
          }
        }
      }

      response '200', 'successful login' do
        let!(:hunter) { create(:hunter) }
        let(:params) { { email: 'hunter@mail.com', password: '1234567890' } }

        run_test!
      end

      response '401', 'invalid credentials' do
        let(:params) { {} }

        run_test!
      end
    end
  end
end
