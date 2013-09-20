module RestPack::Core::Service::Commands
  module Application
    class List < RestPack::Service::Command
      required do
        integer :account_id
      end

      optional do
        integer :page
        integer :page_size
      end

      def execute
        # TODO: GJ: remove the scope when we can specify custom serializer filters
        #           https://github.com/RestPack/restpack_serializer/issues/42
        scope = Core::Models::Application.all
        scope = scope.where(account_id: account_id)

        Core::Serializers::ApplicationSerializer.resource(
          inputs, scope
        )
      end
    end
  end
end
