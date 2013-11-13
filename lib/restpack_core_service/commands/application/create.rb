module Commands::Core::Application
  class Create < RestPack::Service::Commands::Create
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
  end
end
