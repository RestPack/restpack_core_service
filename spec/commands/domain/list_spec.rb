describe Core::Commands::Domain::List do
  is_required :application_id
  is_optional :page, :page_size

  context 'listing' do
    let(:response) { subject.class.run(params) }

    context 'by :application_id' do
      before { create_list(:domain, 2, application_id: 876) }

      context 'matching records' do
        let(:params) { { application_id: 876 } }
        it_succeeds 'has domains' do
          expect(response.result[:meta][:domains][:count]).to eq(2)
        end
      end

      context 'no matching records' do
        let(:params) { { application_id: 999999 } }
        it_succeeds 'has no domains' do
          expect(response.result[:meta][:domains][:count]).to eq(0)
        end
      end
    end
  end
end
