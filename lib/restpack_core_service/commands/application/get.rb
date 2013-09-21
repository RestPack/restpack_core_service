module RestPack::Core::Service::Commands
  module Application
    class Get < RestPack::Service::Command
      required do
        integer :id
        integer :account_id
      end

      def execute
        result = Serializers::Application.resource(inputs)

        if result[:applications].empty?
          status :not_found
        else
          result
        end
      end
    end
  end
end
