module RestPack::Core::Service
  class Configuration < RestPack::Service::Configuration
    attr_accessor :application_id

  end

  mattr_accessor :config
  @@config = Configuration.new

  def self.setup
    yield @@config
  end
end
