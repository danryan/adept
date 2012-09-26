class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.string :name
      t.text :control #, :default => {}.to_json
      t.string :component
      t.string :letter
      t.string :original_filename
      
      t.references :repository
      t.timestamps
    end
  end
end
