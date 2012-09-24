class AddFileToPackage < ActiveRecord::Migration
  def change
    add_column :packages, :file, :string
  end
end
