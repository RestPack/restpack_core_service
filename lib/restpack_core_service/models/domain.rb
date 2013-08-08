module RestPack::Core::Service::Models
  class Domain < Base
    restpack_table_name :domains
    attr_accessible :name, :host

    validates_presence_of :name
    validates :name, :length => { :maximum => 512 }

    belongs_to :host
  end
end
