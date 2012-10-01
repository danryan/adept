class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.string :name
      t.text :control
      t.text :raw_control
      t.text :checksums
      t.string :component
      t.string :architecture
      t.string :kind
      t.string :prefix
      t.string :filename
      t.string :extension
      t.string :size
      t.references :repository
      t.timestamps
    end

    add_index :packages, :repository_id
  end
end
