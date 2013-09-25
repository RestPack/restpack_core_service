require 'spec_helper'

describe Commands::Application::Create do
  #TODO: GJ: validate array

  context 'creating an application' do
    let(:response) { subject.class.run(params) }

    context 'with valid params' do
      let(:application) { {
        name: 'My Amazing Application',
        account_id: 12345
      } }
      let(:params) { {
        applications: [application]
      } }

      it 'returns the newly created application' do
        response.success?.should == true

        applications = response.result[:applications]
        applications.length.should == 1

        applications.first[:name].should == 'My Amazing Application'
        applications.first[:account_id].should == 12345
      end
    end
  end
end
