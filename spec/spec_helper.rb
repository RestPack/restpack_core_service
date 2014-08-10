require 'rspec'
require 'restpack_service/support/spec_helper'
require 'restpack_core_service'

config = YAML.load_file('./config/database.yml')
ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || config['test'])

migrations_path = File.dirname(__FILE__) + "/../db/migrate"
migrations = ActiveRecord::Migrator.up(migrations_path)

FactoryGirl.find_definitions

DatabaseCleaner.strategy = :transaction

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
