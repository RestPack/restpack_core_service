module RestPack::Core::Service::Serializers
  class ApplicationSerializer
    include RestPack::Serializer

    self.model_class = RestPack::Core::Service::Models::Application
    self.key = :applications

    attributes :id
  end
end

#TODO: GJ:  remove once this has been addressed:
#           https://github.com/RestPack/restpack_serializer/issues/41
module RestPack::Core::Service::Models
  class ApplicationSerializer < RestPack::Core::Service::Serializers::ApplicationSerializer

  end
end

class ApplicationSerializer < RestPack::Core::Service::Serializers::ApplicationSerializer

end
