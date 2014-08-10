describe Core::Models::Domain do
  it { should validate_presence_of(:identifier) }
  it { should validate_presence_of(:application_id) }
  it { should ensure_length_of(:identifier).is_at_most(512) }
  it { should belong_to(:application) }

  context "default values" do
    it "has a random session_secret" do
      domain1 = create(:domain)
      domain2 = create(:domain)

      expect(domain1.session_secret).to_not eq(nil)
      expect(domain1.session_secret).to_not eq(domain2.session_secret)
    end

    it "has empty oauth_providers as default" do
      expect(create(:domain).oauth_providers).to eq([])
    end

    it "is not verified" do
      expect(create(:domain).is_verified).to eq(false)
    end
  end
end
