RSpec.describe 'Api::V1::Hunter::OauthController', type: :request do
  let(:google_payload) { { 'email' => 'test@mail.com' } }

  before do
    allow(Auth::GoogleTokenVerifierService).to receive(:call).and_return(google_payload)
  end

  it 'creates hunter and returns token' do
    post '/api/v1/hunter/oauth/google', params: { token: 'fake_google_token' }

    expect(body['hunter']['email']).to eq('test@mail.com')
  end

  private

  def body
    JSON.parse(response.body)
  end
end
