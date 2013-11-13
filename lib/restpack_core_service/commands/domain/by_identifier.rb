require 'public_suffix'

module Commands::Core::Domain
  class ByIdentifier < RestPack::Service::Command
    required do
      string :identifier
    end

    optional do
      string :include
    end

    def execute
      identifiers = [
        inputs[:identifier],
        get_domain(identifier)
      ]

      identifiers.reject(&:nil?).each do |identifier|
        result = Serializers::Core::Domain.resource(
          inputs,
          Models::Core::Domain.where(identifier: identifier)
        )

        if result[:domains].any?
          return result
        end
      end

      status :not_found
    end

    private

    def get_domain(identifier)
      begin
        PublicSuffix.parse(identifier).domain
      rescue
        nil
      end
    end
  end
end
