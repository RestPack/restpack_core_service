module Core::Commands::Domain
  class List < RestPack::Service::Command
    required do
      integer :application_id
    end

    optional do #TODO: GJ: move to base command
      integer :page
      integer :page_size
      string :include
    end

    def execute #TODO: GJ: extract to generic command
      Serializer.resource(inputs)
    end
  end
end
