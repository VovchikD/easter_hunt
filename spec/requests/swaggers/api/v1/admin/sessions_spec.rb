require 'swagger_helper'

RSpec.describe 'Swaggers::Api::V1::Admin::Sessions', type: :request do
  path '/api/v1/admin/login' do
    post 'Login admin' do
      tags 'Admin session'
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
        let!(:admin) { create(:admin) }
        let(:params) { { email: 'admin@mail.com', password: '1234567890' } }

        run_test!
      end

      response '401', 'invalid credentials' do
        let(:params) { {} }

        run_test!
      end
    end
  end
end
