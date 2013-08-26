class CreateDomains < ActiveRecord::Migration
  def change
    create_table :restpack_domains do |t|
      t.string  :identifier, :null => false, :limit => 215
      t.integer :application_id, :null => false
      t.boolean :is_verified, :null => false, :default => false
      t.string  :session_secret, :null => false, :limit => 128
      t.json    :oauth_providers, :null => false

      t.timestamps
    end
  end
end
