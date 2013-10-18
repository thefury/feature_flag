class CreateFeatureFlagToggles < ActiveRecord::Migration
  def change
    create_table :feature_flag_toggles do |t|
      t.string :name
      t.boolean :active

      t.timestamps
    end

    add_index :feature_flag_toggles, :name
    add_index :feature_flag_toggles, [:name, :active]
  end
end


