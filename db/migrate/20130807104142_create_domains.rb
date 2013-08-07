class CreateDomains < ActiveRecord::Migration
  def change
    create_table :domains do |t|
      t.string :host, :null => false, :limit => 512
      t.integer :application_id, :null => false

      t.timestamps
    end
  end
end
