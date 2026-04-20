require 'swagger_helper'

RSpec.describe 'Swaggers::Api::V1::Hunter::Registrations', type: :request do
  path '/api/v1/hunter/signup' do
    post 'Registration hunter' do
      tags 'Hunter registration'
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

      response '200', 'successful registration' do
        let(:params) { { email: 'hunter@mail.com', password: '1234567890' } }

        run_test!
      end
    end
  end
end
