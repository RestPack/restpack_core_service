module RestPack::Core::Service::Commands
  module Domain
    class Create < RestPack::Service::Command
      required do
        array :domains do
          hash do
            required do
              integer :application_id
              string :identifier
            end
          end
        end
      end

      def execute
        domains = Models::Domain.create!(inputs[:domains])
        Serializers::Domain.serialize(domains)
      end
    end
  end
end
