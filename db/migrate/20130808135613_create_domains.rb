class CreateDomains < ActiveRecord::Migration
  def change
    create_table :restpack_domains do |t|
      t.string :identifier, :null => false, :limit => 512
      t.integer :host_id, :null => false

      t.timestamps
    end
  end
end
