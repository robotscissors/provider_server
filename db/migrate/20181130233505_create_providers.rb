class CreateProviders < ActiveRecord::Migration[5.2]
  def change
    create_table :providers do |t|
      t.integer :original_id, index: true
      t.string :url

      t.timestamps
    end
  end
end
