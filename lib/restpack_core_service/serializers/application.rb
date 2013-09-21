module RestPack::Core::Service::Serializers
  class Application
    include RestPack::Serializer

    self.model_class = Models::Application
    self.key = :applications

    attributes :id, :name, :account_id

    can_include :domains
  end
end
