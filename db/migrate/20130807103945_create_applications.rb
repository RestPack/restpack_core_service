class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :name, :null => false, :limit => 256
      t.integer :account_id, :null => false

      t.timestamps
    end
  end
end
