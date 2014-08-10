describe Core::Commands::Application::Get do
  is_required :id, :account_id

  let(:response) { subject.class.run(params) }
  let(:params) { {} }

  before do
    @application = create(:application)
  end

  context 'with valid params' do
    let(:params) { {
      id: @application.id,
      account_id: @application.account_id
    } }

    it 'is valid' do
      expect(response.success?).to eq(true)
    end

    it 'return the application' do
      expect(response.result[:applications].length).to eq(1)
      expect(response.result[:applications].first[:id]).to eq(@application.id.to_s)
    end
  end
end
