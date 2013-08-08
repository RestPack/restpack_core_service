module RestPack::Core::Service::Models
  class Domain < Base
    restpack_table_name :domains
    attr_accessible :identifier, :host

    validates_presence_of :identifier
    validates :identifier, :length => { :maximum => 512 }

    belongs_to :host
  end
end
