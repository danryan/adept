class CreateDistributionPackages < ActiveRecord::Migration
  def change
    create_table :distribution_packages do |t|
      t.references :distribution
      t.references :package

      t.timestamps
    end
    add_index :distribution_packages, [ :distribution_id, :package_id ]
  end
end
