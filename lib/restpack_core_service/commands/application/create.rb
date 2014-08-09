module Core::Commands::Application
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

    def execute #TODO: GJ: extract to generic command
      Serializer.serialize Model.create!(inputs[:applications])
    end
  end
end
