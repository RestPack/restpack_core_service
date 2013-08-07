module RestPack::Core::Service::Models
  class Base < ActiveRecord::Base
    self.abstract_class = true

    def self.restpack_table_name(name)
      self.table_name = RestPack::Core::Service.config.prefix_db_table(name)
    end
  end
end
