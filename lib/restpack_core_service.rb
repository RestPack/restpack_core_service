require "active_record"
require "restpack_service"
require "active_support/core_ext"

require "restpack_core_service/version"
require "restpack_core_service/configuration"

require "restpack_core_service/models/application"
require "restpack_core_service/models/host"
require "restpack_core_service/models/domain"

require "restpack_core_service/services"
require "restpack_core_service/tasks"

module Core
  Models = RestPack::Core::Service::Models
  Commands = RestPack::Core::Service::Commands
  # Serializers = RestPack::Core::Service::Serializers
end
