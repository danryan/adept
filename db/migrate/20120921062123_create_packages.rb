class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.string :name
      t.text :control
      t.text :raw_control
      t.text :checksums
      t.string :component
      t.string :prefix
      t.string :filename
      t.string :extension
      t.string :size
      t.references :repository
      t.timestamps
    end
  end
end
