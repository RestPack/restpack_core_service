require 'spec_helper'

describe Commands::Application::Create do
  it_acts_as_create_command(:application)

  pending 'validate command inputs'
end
