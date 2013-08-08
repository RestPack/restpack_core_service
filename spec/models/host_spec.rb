describe RestPack::Core::Service::Models::Host do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:application_id) }
  it { should validate_presence_of(:session_secret) }
  it { should validate_presence_of(:oauth_providers) }
  it { should ensure_length_of(:name).is_at_most(256) }
  it { should belong_to(:application) }
  it { should have_many(:domains) }
  it { subject.class.table_name.should == 'restpack_hosts' }
end
