require 'require_all'

require "restpack_service"
require "restpack_serializer"
require "active_support/core_ext"

require "restpack_core_service/version"
require "restpack_core_service/configuration"
require "restpack_core_service/tasks"

require_rel "restpack_core_service/models"
require_rel "restpack_core_service/serializers"
require_rel "restpack_core_service/commands"

module Core
  Models = RestPack::Core::Service::Models
  Commands = RestPack::Core::Service::Commands
  Serializers = RestPack::Core::Service::Serializers
end
