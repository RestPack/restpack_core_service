require 'spec_helper'

describe Commands::Domain::Create do
  it_acts_as_create_command(:domain)

  pending 'validate command inputs'
  pending 'test invalid domain formats ("hostname", "no spaces", ip addresses...)'
end
