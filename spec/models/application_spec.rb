describe RestPack::Core::Service::Models::Application do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:account_id) }
  it { should ensure_length_of(:name).is_at_most(256) }
  it { should have_many(:hosts) }
  it { subject.class.table_name.should == 'restpack_applications' }
end
