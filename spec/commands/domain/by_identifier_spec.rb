require 'spec_helper'

describe Core::Commands::Domain::ByIdentifier do
  is_required :identifier
  is_optional :include

  let(:response) { subject.class.run(params) }
  let(:domain) { create(:domain) }

  context 'with valid params' do
    let(:params) { {
      identifier: domain.identifier,
      include: 'applications'
    } }

    it_succeeds do
      expect(response.result[:domains].length).to eq(1)
      expect(response.result[:domains].first[:identifier]).to eq(domain.identifier)

      expect(response.result[:linked][:applications].length).to eq(1)
      expect(response.result[:linked][:applications].first[:id]).to eq(domain.application_id.to_s)
    end

    context 'with subdomain in identifier' do
      let(:params) { {
        identifier: "www.#{domain.identifier}",
        include: 'applications'
      } }

      it_succeeds
    end
  end

  context 'with invalid :identifier' do
    let(:params) { {
      identifier: 'invalid'
    }}

    it_fails_with(:not_found)
  end
end
