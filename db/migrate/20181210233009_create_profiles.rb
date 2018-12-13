class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :title
      t.string :gender
      t.text :specializing_in
      t.text :locations
      t.text :specialties
      t.text :professional_statement

      t.timestamps
    end
  end
end
