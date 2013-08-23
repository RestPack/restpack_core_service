class CreateApplications < ActiveRecord::Migration
  def change
    create_table :restpack_applications do |t|
      t.string  :name, :null => false, :limit => 256
      t.string  :api_token, :null => false, :limit => 512
      t.integer :account_id, :null => false

      t.timestamps
    end
  end
end
