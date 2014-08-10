describe Core::Commands::Application::List do
  is_required :account_id
  is_optional :page, :page_size

  context 'listing' do
    let(:response) { subject.class.run(params) }

    context 'by :account_id' do
      before { create_list(:application, 3, account_id: 142857) }

      context 'matching records' do
        let(:params) { { account_id: 142857 } }
        it_succeeds 'has applications' do
          expect(response.result[:meta][:applications][:count]).to eq(3)
        end
      end

      context 'no matching records' do
        let(:params) { { account_id: 999999 } }
        it_succeeds 'has no applications' do
          expect(response.result[:meta][:applications][:count]).to eq(0)
        end
      end
    end
  end
end
