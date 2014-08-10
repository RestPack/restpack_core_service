module Core::Commands::Domain
  class Get < RestPack::Service::Command
    required do
      integer :id
      integer :application_id
    end

    def execute #TODO: GJ: extract to generic command
      result = Serializer.resource(inputs)

      if result[:domains].empty?
        status :not_found
      else
        result
      end
    end
  end
end
