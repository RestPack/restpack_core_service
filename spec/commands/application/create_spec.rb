require 'spec_helper'

describe Commands::Core::Application::Create do
  it_acts_as_create_command(:core, :application)

  pending 'validate command inputs'
end
