class CreateHosts < ActiveRecord::Migration
  def table_name
    RestPack::Core::Service.config.prefix_db_table(:hosts)
  end

  def change
    create_table table_name do |t|
      t.string  :name, :null => false, :limit => 256
      t.integer :application_id, :null => false
      t.string  :session_secret, :null => false, :limit => 256 #TODO: GJ: a sensible limit
      t.json    :oauth_providers, :null => false

      t.timestamps
    end
  end
end
