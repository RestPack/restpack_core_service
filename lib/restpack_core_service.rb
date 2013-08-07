require "restpack_service"
require "active_support/core_ext"

require "restpack_core_service/version"
require "restpack_core_service/configuration"

module RestPack::Core::Service
  mattr_accessor :config
  @@config = Configuration.new

  def self.setup
    yield @@config
  end
end

