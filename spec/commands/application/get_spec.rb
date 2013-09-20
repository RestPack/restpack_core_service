require_relative '../../spec_helper'

describe RestPack::Core::Service::Commands::Application::Get do
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
      response.success?.should == true
    end

    it 'return the application' do
      response.result[:applications].length.should == 1
      response.result[:applications].first[:id].should == @application.id.to_s
    end
  end
end
