describe RestPack::Models::Domain do
  it { should validate_presence_of(:host) }
  it { should ensure_length_of(:host).is_at_most(512) }
  it { should belong_to(:application) }
end
