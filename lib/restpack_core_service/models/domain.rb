module RestPack::Core::Service::Models
  class Domain < Base
    restpack_table_name :domains
    attr_accessible :host, :application

    validates_presence_of :host
    validates :host, :length => { :maximum => 512 }

    belongs_to :application
  end
end
