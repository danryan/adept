class AddTypeToRepository < ActiveRecord::Migration
  def change
    add_column :repositories, :type, :string, null: false

    add_index :repositories, :type
  end
end
