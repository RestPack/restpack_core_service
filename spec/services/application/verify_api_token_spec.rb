require_relative '../../spec_helper'

describe Core::Commands::Application::VerifyApiToken do
  is_required :id, :api_token

  let(:response) { subject.class.run(params) }

  before do
    @application = create(:application)
  end

  context 'with valid params' do
    let(:params) { {
      id: @application.id,
      api_token: @application.api_token
    } }

    it 'is valid' do
      response.success?.should == true
      response.result.should == { id: @application.id }
    end
  end

  context 'with invalid :id' do
    let(:params) { {
      id: 142857,
      api_token: @application.api_token
    }}

    it 'is forbidden' do
      response.success?.should == false
      response.result.should == {}
      response.status.should == :forbidden
    end
  end

  context 'with invalid :api_token' do
    let(:params) { {
      id: @application.id,
      api_token: 'invalid_token'
    }}

    it 'is forbidden' do
      response.success?.should == false
      response.result.should == {}
      response.status.should == :forbidden
    end
  end
end
