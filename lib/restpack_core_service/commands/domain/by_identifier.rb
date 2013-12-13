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
        without_subdomain(identifier)
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

    def without_subdomain(identifier)
      identifier.split('.')[1..-1].join('.')
    end
  end
end
