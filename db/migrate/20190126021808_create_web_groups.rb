class CreateWebGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :web_groups do |t|
      t.string :group_name
      t.text :description

      t.timestamps
    end
  end
end
