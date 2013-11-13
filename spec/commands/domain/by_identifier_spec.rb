require 'spec_helper'

describe Commands::Core::Domain::ByIdentifier do
  is_required :identifier
  is_optional :include

  let(:response) { subject.class.run(params) }

  before do
    @domain = create(:domain)
  end

  context 'with valid params' do
    let(:params) { {
      identifier: @domain.identifier,
      include: 'applications'
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
      response.result[:applications].first[:id].should == @domain.application_id.to_s
    end

    context 'with subdomain in identifier' do
      let(:params) { {
        identifier: "www.#{@domain.identifier}",
        include: 'applications'
      } }

      it 'is valid' do
        response.success?.should == true
      end
    end
  end

  context 'with invalid :identifier' do
    let(:params) { {
      identifier: 'invalid'
    }}

    it 'is :not_found' do
      response.success?.should == false
      response.result.should == {}
      response.status.should == :not_found
    end
  end
end
