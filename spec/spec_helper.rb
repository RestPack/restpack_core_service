require 'active_record'
require 'rspec'
require 'database_cleaner'
require 'yaml'
require 'shoulda-matchers'
require 'restpack_core_service'

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
