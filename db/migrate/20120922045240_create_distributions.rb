class CreateDistributions < ActiveRecord::Migration
  def change
    create_table :distributions do |t|
      t.string :origin
      t.string :label
      t.string :codename
      t.string :description
      t.string :sign_with

      t.timestamps
    end
  end
end
