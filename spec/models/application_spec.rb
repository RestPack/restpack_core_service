describe Core::Models::Application do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:account_id) }
  it { should ensure_length_of(:name).is_at_most(256) }
  it { should have_many(:domains) }

  context "default values" do
    it "has a random api_token" do
      app1 = create(:application)
      app2 = create(:application)

      expect(app1.api_token.length).to eq(32)
      expect(app1.api_token).to_not eq(app2.api_token)
    end
  end
end
