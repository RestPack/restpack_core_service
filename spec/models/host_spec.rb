describe RestPack::Core::Service::Models::Host do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:application_id) }
  it { should ensure_length_of(:name).is_at_most(256) }
  it { should belong_to(:application) }
  it { should have_many(:domains) }
  it { subject.class.table_name.should == 'restpack_hosts' }

  it "has a random session_secret" do
    host1 = create(:host)
    host2 = create(:host)

    host1.session_secret.should_not == nil
    host1.session_secret.should_not == host2.session_secret
  end

  it "has empty oauth_providers as default" do
    create(:host).oauth_providers.should == {}
  end
end
