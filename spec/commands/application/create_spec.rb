require 'spec_helper'

describe Commands::Application::Create do
  #TODO: GJ: validate array

  context 'creating an application' do
    let(:response) { subject.class.run(params) }

    context 'with valid params' do
      let(:application) { build(:application_request) }
      let(:params) { {
        applications: [application]
      } }

      it 'returns the newly created application' do
        response.success?.should == true

        applications = response.result[:applications]
        applications.length.should == 1

        applications.first[:name].should == application[:name]
        applications.first[:account_id].should == application[:account_id]
      end
    end
  end
end
