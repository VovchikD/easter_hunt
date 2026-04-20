RSpec.describe 'Api::V1::Hunter::EasterEggsController', type: :request do
  let!(:hunter)         { create(:hunter) }
  let(:token)           { Auth::JwtService.generate_token(payload: { hunter_id: hunter.id }) }
  let(:headers)         { { 'Authorization' => "Bearer #{token}" } }
  let!(:not_found_eggs) { create_list(:easter_egg, 2, found: false) }
  let!(:found_eggs)     { create_list(:easter_egg, 1, found: true, discoverer: hunter) }

  it 'receive list eggs of found' do
    get '/api/v1/hunter/easter_eggs/found', params: {}, headers: headers

    expect(body.size).to eq(1)
  end

  it 'receive list eggs of not found' do
    get '/api/v1/hunter/easter_eggs/not_found', params: {}, headers: headers

    expect(body.size).to eq(2)
  end

  it 'mark egg as found' do
    egg = create(:easter_egg)
    patch "/api/v1/hunter/easter_eggs/mark_found", params: { code: egg.code }, headers: headers

    expect(response).to have_http_status(:ok)
  end

  private

  def body
    JSON.parse(response.body)
  end
end
