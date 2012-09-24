class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.references :distribution
      t.references :package

      t.timestamps
    end
    add_index :references, :distribution_id
    add_index :references, :package_id
  end
end
