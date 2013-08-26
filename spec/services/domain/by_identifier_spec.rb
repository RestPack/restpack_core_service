require_relative '../../spec_helper'

describe Core::Commands::Domain::ByIdentifier do
  is_required :identifier

  let(:response) { subject.class.run(params) }

  before do
    @domain = create(:domain)
  end

  context 'with valid params' do
    let(:params) { {
      identifier: @domain.identifier,
      includes: 'application'
    } }

    it 'is valid' do
      response.success?.should == true
    end

    it 'includes identifier' do
      response.result[:domains].length.should == 1
      response.result[:domains].first[:identifier].should == @domain.identifier
    end

    it 'includes related application' do
      response.result[:applications].length.should == 1
    end
  end

  # context 'with invalid :id' do
  #   let(:params) { {
  #     id: 142857,
  #     api_token: @application.api_token
  #   }}

  #   it 'is forbidden' do
  #     response.success?.should == false
  #     response.result.should == {}
  #     response.status.should == :forbidden
  #   end
  # end

  # context 'with invalid :api_token' do
  #   let(:params) { {
  #     id: @application.id,
  #     api_token: 'invalid_token'
  #   }}

  #   it 'is forbidden' do
  #     response.success?.should == false
  #     response.result.should == {}
  #     response.status.should == :forbidden
  #   end
  # end
end
