module Core::Serializers
  class Application
    include RestPack::Serializer

    self.model_class = Core::Models::Application
    self.key = :applications

    attributes :id, :name, :account_id

    can_include :domains
    can_filter_by :account_id
  end
end
