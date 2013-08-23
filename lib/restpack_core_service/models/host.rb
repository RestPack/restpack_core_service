module RestPack::Core::Service::Models
  class Host < ActiveRecord::Base
    self.table_name = :restpack_hosts
    attr_accessible :name, :application_id, :session_secret, :oauth_providers

    validates_presence_of :name, :application_id
    validates :name, :length => { :maximum => 256 }

    has_many :domains
    belongs_to :application

    before_save -> {
      self.oauth_providers ||= {}
      self.session_secret ||= SecureRandom.hex(16)
    }
  end
end
