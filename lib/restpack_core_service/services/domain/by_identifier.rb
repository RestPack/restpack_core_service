module RestPack::Core::Service::Commands::Domain
  class ByIdentifier < RestPack::Service::Command
    required do
      string :identifier
      string :includes
    end

    def execute
      result = Core::Serializers::DomainSerializer.resource(
        inputs,
        Core::Models::Domain.where(identifier: inputs[:identifier])
      )

      if result[:domains].any?
        result
      else
        status :not_found
      end
    end
  end
end
