RSpec.shared_examples 'authentication endpoint' do |factory:, path:, email:|
  let!(:user) { create(factory, email: email, password: '1234567890') }

  let(:valid_params) do
    { email: email, password: '1234567890' }
  end

  let(:invalid_params) do
    { email: 'wrong@mail.com', password: 'wrong' }
  end

  it 'successful login' do
    post path, params: valid_params

    expect(body['result']['status']).to eq('success')
  end

  it 'failure login' do
    post path, params: invalid_params

    expect(body['result']['status']).to eq('failure')
  end

  private

  def body
    JSON.parse(response.body)
  end
end
