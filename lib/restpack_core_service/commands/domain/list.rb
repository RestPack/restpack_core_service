module Commands::Core::Domain
  class List < RestPack::Service::Commands::List
    required do
      integer :application_id
    end

    optional do
      integer :page
      integer :page_size
      string :include
    end
  end
end
