class CreateHosts < ActiveRecord::Migration
  def change
    create_table :restpack_hosts do |t|
      t.string  :name, :null => false, :limit => 256
      t.integer :application_id, :null => false
      t.string  :session_secret, :null => false, :limit => 128
      t.json    :oauth_providers, :null => false

      t.timestamps
    end
  end
end
