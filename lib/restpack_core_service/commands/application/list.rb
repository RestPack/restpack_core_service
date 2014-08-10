module Core::Commands::Application
  class List < RestPack::Service::Command
    required do
      integer :account_id
    end

    optional do
      integer :page
      integer :page_size
      string :include
    end

    def execute #TODO: GJ: extract to generic command
      Serializer.resource(inputs)
    end
  end
end
