# require_relative 'factories/activity_factory'
# require_relative 'support/mutations_matchers'
require 'active_record'
require 'rspec'
require 'database_cleaner'
require 'yaml'
require 'restpack_core_service'
# require 'coveralls'
# Coveralls.wear!

config = YAML.load_file('./config/database.yml')
ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || config['test'])

migrations_path = File.dirname(__FILE__) + "/../db/migrate"
migrator = ActiveRecord::Migrator.new(:up, migrations_path)
migrator.migrate

DatabaseCleaner.strategy = :transaction

RSpec.configure do |config|
  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
