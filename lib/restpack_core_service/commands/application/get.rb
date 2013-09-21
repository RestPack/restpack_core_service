module RestPack::Core::Service::Commands
  module Application
    class Get < RestPack::Service::Command
      required do
        integer :id
        integer :account_id
      end

      def execute
        # TODO: GJ: remove the :account_id scope when we can specify custom serializer filters
        #          https://github.com/RestPack/restpack_serializer/issues/42
        result = Serializers::Application.resource(
          inputs,
          Models::Application.where(account_id: account_id)
        )

        if result[:applications].empty?
          status :not_found
        else
          result
        end
      end
    end
  end
end
