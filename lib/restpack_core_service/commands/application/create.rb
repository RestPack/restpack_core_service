module RestPack::Core::Service::Commands
  module Application
    class Create < RestPack::Service::Command
      required do
        array :applications do
          hash do
            required do
              integer :account_id
              string :name
            end
          end
        end
      end

      def execute
        applications = Models::Application.create!(inputs[:applications])
        Serializers::Application.serialize(applications)
      end
    end
  end
end
