module Core::Commands::Domain
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

    def execute #TODO: GJ: extract to generic command
      Serializer.serialize Model.create!(inputs[:domains])
    end
  end
end
