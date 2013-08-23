module RestPack::Core::Service::Models
  class Domain < ActiveRecord::Base
    self.table_name = :restpack_domains
    attr_accessible :identifier, :host

    validates_presence_of :identifier
    validates :identifier, :length => { :maximum => 512 }

    belongs_to :host
  end
end
