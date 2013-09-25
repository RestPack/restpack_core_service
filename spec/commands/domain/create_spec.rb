require 'spec_helper'

describe Commands::Domain::Create do
  #TODO: GJ: validate array

  context 'creating a domain' do
    let(:response) { subject.class.run(params) }

    pending 'test invalid domain formats ("hostname", "no spaces", ip addresses...)'

    context 'with valid params' do
      let(:domain) { {
        identifier: 'gavinjoyce.io',
        application_id: 12345
      } }
      let(:params) { {
        domains: [domain]
      } }

      it 'returns the newly created resource' do
        response.success?.should == true

        resources = response.result[:domains]
        resources.length.should == 1

        resources.first[:identifier].should == 'gavinjoyce.io'
        resources.first[:application_id].should == 12345
      end
    end
  end
end
