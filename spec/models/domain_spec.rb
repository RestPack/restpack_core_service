describe Models::Domain do
  it { should validate_presence_of(:identifier) }
  it { should validate_presence_of(:application_id) }
  it { should ensure_length_of(:identifier).is_at_most(512) }
  it { should belong_to(:application) }
  it { subject.class.table_name.should == 'restpack_domains' }

  context "default values" do
    it "has a random session_secret" do
      domain1 = create(:domain)
      domain2 = create(:domain)

      domain1.session_secret.should_not == nil
      domain1.session_secret.should_not == domain2.session_secret
    end

    it "has empty oauth_providers as default" do
      create(:domain).oauth_providers.should == {}
    end

    it "is not verified" do
      create(:domain).is_verified.should == false
    end
  end
end
