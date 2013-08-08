describe RestPack::Core::Service::Models::Domain do
  it { should validate_presence_of(:name) }
  it { should ensure_length_of(:name).is_at_most(512) }
  it { should belong_to(:host) }
  it { subject.class.table_name.should == 'restpack_domains' }
end
