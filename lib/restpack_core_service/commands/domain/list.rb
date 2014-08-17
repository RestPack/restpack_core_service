module Core::Commands::Domain
  class List < RestPack::Service::Commands::List
    required do
      integer :application_id
    end
  end
end
