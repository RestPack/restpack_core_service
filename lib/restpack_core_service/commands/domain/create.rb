module Core::Commands::Domain
  class Create < RestPack::Service::Commands::Create
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
  end
end
