module RestPack::Core::Service::Models
  class Host < Base
    restpack_table_name :hosts
    attr_accessible :name, :application_id, :session_secret, :oauth_providers

    validates_presence_of :name, :application_id, :session_secret, :oauth_providers
    validates :name, :length => { :maximum => 256 }

    has_many :domains
    belongs_to :application
  end
end
