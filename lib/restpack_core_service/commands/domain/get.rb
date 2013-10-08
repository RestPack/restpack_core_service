module RestPack::Core::Service::Commands
  module Domain
    class Get < RestPack::Service::Command
      required do
        integer :id
        integer :application_id
      end

      def execute
        result = Serializers::Domain.resource(inputs)

        if result[:domains].empty?
          status :not_found
        else
          result
        end
      end
    end
  end
end
