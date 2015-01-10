class CreateSimpleToggleToggles < ActiveRecord::Migration
  def change
    create_table :simple_toggle_toggles do |t|
      t.string :name
      t.boolean :active

      t.timestamps
    end

    add_index :simple_toggle_toggles, :name
    add_index :simple_toggle_toggles, [:name, :active]
  end
end


