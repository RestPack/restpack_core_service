module RestPack::Core::Service::Commands
  module Domain
    class List < RestPack::Service::Command
      required do
        integer :application_id
      end

      optional do
        integer :page
        integer :page_size
        string :include
      end

      def execute
        Serializers::Domain.resource(inputs)
      end
    end
  end
end
