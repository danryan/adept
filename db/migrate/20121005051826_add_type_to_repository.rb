class AddTypeToRepository < ActiveRecord::Migration
  def change
    add_column :repositories, :type, :string

    add_index :repositories, :type
  end
end
