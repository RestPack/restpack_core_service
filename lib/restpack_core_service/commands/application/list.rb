module Core::Commands::Application
  class List < RestPack::Service::Commands::List
    required do
      integer :account_id
    end
  end
end
