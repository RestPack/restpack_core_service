describe Core::Commands::Application::VerifyApiToken do
  is_required :id, :api_token

  let(:response) { subject.class.run(params) }
  let(:application) { create(:application) }

  context 'with valid params' do
    let(:params) { {
      id: application.id,
      api_token: application.api_token
    } }

    it_succeeds do
      expect(response.result[:id]).to eq(application.id)
    end
  end

  context 'with invalid :id' do
    let(:params) { {
      id: 142857,
      api_token: application.api_token
    }}

    it_fails_with(:forbidden)
  end

  context 'with invalid :api_token' do
    let(:params) { {
      id: application.id,
      api_token: 'invalid_token'
    }}

    it_fails_with(:forbidden)
  end
end
