module RestPack::Core::Service::Models
  class Application < Base
    restpack_table_name :applications
    attr_accessible :name, :account_id

    validates_presence_of :name, :account_id
    validates :name, :length => { :maximum => 256 }

    has_many :domains
  end
end
