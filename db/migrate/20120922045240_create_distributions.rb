class CreateDistributions < ActiveRecord::Migration
  def change
    create_table :distributions do |t|
      t.string :origin
      t.string :label
      t.string :codename
      t.string :description

      t.references :repository
     
      ## UUID
      t.string :uuid

      t.timestamps
    end

    add_index :distributions, :repository_id
  end
end
