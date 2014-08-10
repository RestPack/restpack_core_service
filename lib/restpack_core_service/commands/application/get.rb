module Core::Commands::Application
  class Get < RestPack::Service::Command
    required do
      integer :id
      integer :account_id
    end

    def execute #TODO: GJ: extract to generic command
      result = Serializer.resource(inputs)

      if result[:applications].empty?
        status :not_found
      else
        result
      end
    end
  end
end
