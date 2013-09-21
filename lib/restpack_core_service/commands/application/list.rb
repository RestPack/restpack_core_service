module RestPack::Core::Service::Commands
  module Application
    class List < RestPack::Service::Command
      required do
        integer :account_id
      end

      optional do
        integer :page
        integer :page_size
        string :includes
      end

      def execute
        Serializers::Application.resource(inputs)
      end
    end
  end
end
