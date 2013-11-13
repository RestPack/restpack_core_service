require 'spec_helper'

describe Commands::Core::Application::List do
  is_required :account_id
  is_optional :page, :page_size

  before do
    @applications = create_list(:application, 5)
  end

  context 'listing' do
    let(:response) { subject.class.run(params) }

    context 'by :account_id' do
      before { create_list(:application, 3, account_id: 142857) }

      context 'valid' do
        let(:params) { { account_id: 142857 } }
        it 'returns correct applications' do
          response.result[:meta][:applications][:count].should == 3
        end
      end

      context 'invalid' do
        let(:params) { { account_id: 999999 } }
        it 'returns no applications' do
          response.result[:meta][:applications][:count].should == 0
        end
      end
    end
  end
end
