module Commands::Core::Application
  class List < RestPack::Service::Commands::List
    required do
      integer :account_id
    end

    optional do
      integer :page
      integer :page_size
      string :include
    end
  end
end
