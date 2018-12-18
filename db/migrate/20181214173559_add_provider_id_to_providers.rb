class AddProviderIdToProviders < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :provider_id, :integer, null: false
  end
end
