RSpec.describe 'Api::V1::Admin::EasterEggsController', type: :request do
  let!(:admin)          { create(:admin) }
  let(:token)           { Auth::JwtService.generate_token(payload: { admin_id: admin.id }) }
  let(:headers)         { { 'Authorization' => "Bearer #{token}" } }
  let!(:hunter)         { create(:hunter) }
  let!(:not_found_eggs) { create_list(:easter_egg, 2, found: false) }
  let!(:found_eggs)     { create_list(:easter_egg, 1, found: true, discoverer: hunter) }

  it 'receive list eggs' do
    get '/api/v1/admin/easter_eggs', params: {}, headers: headers

    expect(body.size).to eq(3)
  end

  it 'filtered by status' do
    get '/api/v1/admin/easter_eggs', params: { status: :not_found }, headers: headers

    expect(body.size).to eq(2)
  end

  it 'filtered by discoverer' do
    get '/api/v1/admin/easter_eggs', params: { hunter_email: hunter.email }, headers: headers

    expect(body.size).to eq(1)
  end

  it 'create egg' do
    expect {
      post '/api/v1/admin/easter_eggs', params: {
        latitude: 1.9,
        longitude: 4.1,
        clue: 'test'
      }, headers: headers
    }.to change(EasterEgg, :count).by(1)
  end

  it 'update egg' do
    egg = create(:easter_egg, clue: 'old')

    patch "/api/v1/admin/easter_eggs/#{egg.id}", params: { clue: 'updated' }, headers: headers

    expect(body["clue"]).to eq("updated")
  end

  private

  def body
    JSON.parse(response.body)
  end
end
