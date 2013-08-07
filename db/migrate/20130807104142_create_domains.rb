class CreateDomains < ActiveRecord::Migration
  def table_name
    RestPack::Core::Service.config.prefix_db_table(:domains)
  end

  def change
    create_table table_name do |t|
      t.string :host, :null => false, :limit => 512
      t.integer :application_id, :null => false

      t.timestamps
    end
  end
end
