module Core::Commands::Application
  class Get < RestPack::Service::Commands::Get
    required do
      integer :id
      integer :account_id
    end
  end
end
