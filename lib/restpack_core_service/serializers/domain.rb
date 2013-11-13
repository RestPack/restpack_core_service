module Serializers::Core
  class Domain
    include RestPack::Serializer

    self.model_class = Models::Core::Domain
    self.key = :domains

    attributes :id, :identifier, :application_id, :is_verified,
               :session_secret, :oauth_providers

    can_include :applications
    can_filter_by :application_id
  end
end
