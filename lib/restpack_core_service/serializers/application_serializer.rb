module RestPack::Core::Service::Serializers
  class ApplicationSerializer
    include RestPack::Serializer

    self.model_class = RestPack::Core::Service::Models::Application
    self.key = :applications

    attributes :id, :name, :account_id

    can_include :domains
  end
end
