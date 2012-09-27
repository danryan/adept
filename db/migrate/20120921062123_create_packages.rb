class CreatePackages < ActiveRecord::Migration
  def up
    create_table :packages do |t|
      t.string :name
      t.hstore :control
      t.text :raw_control
      t.hstore :checksums
      t.string :component
      t.string :prefix
      t.string :filename
      t.string :extension
      t.string :size
      t.references :repository
      t.timestamps
    end

    execute "CREATE INDEX packages_gin_control ON packages USING GIN(control)"
    execute "CREATE INDEX packages_gin_checksums ON packages USING GIN(checksums)"
  end

  def down
    drop_table :packages
    
    execute "DROP INDEX packages_gin_control"
    execute "DROP INDEX packages_gin_checksums"
  end
end
