class CreateRepositories < ActiveRecord::Migration
  def change
    create_table :repositories do |t|
      t.string :name
      t.references :user
      t.boolean :public, default: false
      
      ## UUID
      t.string :uuid
      
      t.timestamps
    end

    add_index :repositories, :user_id
  end
end
