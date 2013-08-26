module RestPack::Core::Service::Models
  class Domain < ActiveRecord::Base
    self.table_name = :restpack_domains
    attr_accessible :identifier, :application_id, :is_verified, :session_secret, :oauth_providers

    validates_presence_of :identifier, :application_id
    validates :identifier, :length => { :maximum => 512 }

    belongs_to :application, class_name: 'RestPack::Core::Service::Models::Application'

    before_save -> {
      self.oauth_providers ||= {}
      self.session_secret ||= SecureRandom.hex(16)
    }
  end
end
