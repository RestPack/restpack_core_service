class CreateApplications < ActiveRecord::Migration
  def table_name
    RestPack::Core::Service.config.prefix_db_table(:applications)
  end

  def change
    create_table table_name do |t|
      t.string  :name, :null => false, :limit => 256
      t.string  :api_token, :null => false, :limit => 512
      t.integer :account_id, :null => false

      t.timestamps
    end
  end
end
