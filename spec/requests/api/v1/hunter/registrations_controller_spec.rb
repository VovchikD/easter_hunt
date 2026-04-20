RSpec.describe 'Api::V1::Hunter::RegistrationsController', type: :request do
  let(:params) { { email: 'hunter@test.com', password: '1234567890' } }

  it 'successfull registration' do
    post '/api/v1/hunter/signup', params: params

    expect(body['result']['status']).to eq('success')
  end

  private

  def body
    JSON.parse(response.body)
  end
end
