require 'spec_helper'

describe RestPack::Core::Service::Configuration do
  it "has a default table prefix" do
    RestPack::Core::Service.config.db_table_prefix.should == "restpack_"
  end
end
